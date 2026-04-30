#!/bin/sh
set -eu

usage() {
  cat <<'USAGE'
Usage: scripts/link-home.sh [--dry-run] [--force] [--backup]

Symlink selected home dotfiles and each direct file or directory inside
.config, .local, and .tmp into the matching location under $HOME.

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
  dest=$HOME/$base/$(basename -- "$src")
  link_path "$src" "$dest"
}

link_path() {
  src=$1
  dest=$2
  dest_dir=$(dirname -- "$dest")

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

home_dotfiles='
.ghci:.ghci
.haskeline:.haskeline
.inputrc:.inputrc
.tmux.conf:.tmux.conf
.xmodmap:.xmodmap
xmonad.hs:.xmonad.hs
.zprofile:.zprofile
.zshenv:.zshenv
.zshrc:.zshrc
'

while IFS=: read -r src_name dest_name; do
  [ -n "$src_name" ] || continue
  src=$repo_dir/$src_name

  if [ ! -e "$src" ] && [ ! -L "$src" ]; then
    printf 'missing: %s\n' "$src" >&2
    continue
  fi

  found_source=1
  link_path "$src" "$HOME/$dest_name"
done <<EOF
$home_dotfiles
EOF

for base in .config .local .tmp; do
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
  echo "No home dotfiles, .config, .local, or .tmp directory found in $repo_dir." >&2
  exit 1
fi
