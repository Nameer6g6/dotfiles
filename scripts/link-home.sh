#!/bin/sh
set -eu

usage() {
  cat <<'USAGE'
Usage: scripts/link-home.sh [--dry-run] [--force] [--backup]

Symlink each direct file or directory inside .config and .local into the
matching directory under $HOME.

Options:
  -n, --dry-run  Show what would be linked without changing anything
  -f, --force    Replace existing destination paths
  -b, --backup   Move existing destination paths aside before linking
  -h, --help     Show this help
USAGE
}

dry_run=0
force=0
backup=0

while [ "$#" -gt 0 ]; do
  case "$1" in
    -n|--dry-run) dry_run=1 ;;
    -f|--force) force=1 ;;
    -b|--backup) backup=1 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage >&2; exit 2 ;;
  esac
  shift
done

if [ "$force" -eq 1 ] && [ "$backup" -eq 1 ]; then
  echo "Use only one of --force or --backup." >&2
  exit 2
fi

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
repo_dir=$(CDPATH= cd -- "$script_dir/.." && pwd)

link_entry() {
  src=$1
  base=$2
  dest_dir=$HOME/$base
  dest=$dest_dir/$(basename -- "$src")

  if [ -L "$dest" ]; then
    current=$(readlink -- "$dest")
    if [ "$current" = "$src" ]; then
      printf 'ok: %s -> %s\n' "$dest" "$src"
      return
    fi
  fi

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    if [ "$backup" -eq 1 ]; then
      backup_dest=$dest.backup.$(date +%Y%m%d%H%M%S)
      printf 'backup: %s -> %s\n' "$dest" "$backup_dest"
      [ "$dry_run" -eq 1 ] || mv -- "$dest" "$backup_dest"
    elif [ "$force" -eq 1 ]; then
      printf 'replace: %s\n' "$dest"
      [ "$dry_run" -eq 1 ] || rm -rf -- "$dest"
    else
      printf 'skip: %s exists\n' "$dest" >&2
      return
    fi
  fi

  printf 'link: %s -> %s\n' "$dest" "$src"
  [ "$dry_run" -eq 1 ] || ln -s -- "$src" "$dest"
}

found_source=0

for base in .config .local; do
  dir=$repo_dir/$base

  if [ ! -d "$dir" ]; then
    printf 'missing: %s\n' "$dir" >&2
    continue
  fi

  found_source=1
  dest_dir=$HOME/$base
  if [ ! -d "$dest_dir" ]; then
    printf 'mkdir: %s\n' "$dest_dir"
    [ "$dry_run" -eq 1 ] || mkdir -p -- "$dest_dir"
  fi

  for path in "$dir"/* "$dir"/.[!.]* "$dir"/..?*; do
    [ -e "$path" ] || [ -L "$path" ] || continue
    link_entry "$path" "$base"
  done
done

if [ "$found_source" -eq 0 ]; then
  echo "No .config or .local directory found in $repo_dir." >&2
  exit 1
fi
