#!/bin/sh

unZip() {
  filename=$(basename "$1" .zip)
  mkdir -p "$filename"
  unzip "$1" -d "$filename"
}
unRar() {
  filename=$(basename "$1" .rar)
  mkdir -p "$filename"
  unrar x "$1" -d "$filename"
}

set_alert() {
  play_sound="mpv --no-terminal --quiet --really-quiet --keep-open=no $HOME/Stuff/alert_sounds/mixkit-clear-announce-tones-2861.wav"
  [ -n "$1" -a -n "$2" -a -n "$3" ] && termdown $1 && notify-send $2 $3 && eval $play_sound && return
  [ -n "$1" -a -n "$2" ] && termdown $1 && notify-send $2 && eval $play_sound && return
  [ -n "$1" ] && termdown $1 && notify-send "Finished" && eval $play_sound && return
  echo "Error: Three arguments are required."
}

clipTrans() {
  ffmpeg -i $1 -ss $2 -t $3 -c:v libx264 -crf 23 -preset fast -c:a aac -b:a 192k $4
}

clipTransMute() {
  ffmpeg -i "$1" -ss "$2" -t "$3" -c:v libx264 -crf 23 -preset fast -an "$4"
}

get_x_gif() {
  title=$(yt-dlp --get-title "$1")
  safe_title=$(printf '%s' "$title" | tr '/\\"' '_')
  file_name=$(yt-dlp --no-simulate -f "mp4" -o "__temp.%(ext)s" --print filename --quiet --no-warnings "$1" 2>/dev/null)
  width=$(ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=p=0 $file_name)
  height=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 $file_name)
  fps=$(exiftool __temp.mp4 | grep -i "Frame Rate" | grep -oE '[0-9]+(\.[0-9]+)?' | awk '{print int($1)==$1 ? $1 : int($1)+1}')
  gifski --quality 100 --extra --repeat=0 --width $width --height $height --fps $fps -o "${safe_title}.gif" $file_name
  rm $file_name
}

convert_x_video_gif() {
  width=$(ffprobe -v error -select_streams v:0 -show_entries stream=width -of csv=p=0 $1)
  height=$(ffprobe -v error -select_streams v:0 -show_entries stream=height -of csv=p=0 $1)
  fps=$(exiftool $1 | grep -i "Frame Rate" | grep -oE '[0-9]+(\.[0-9]+)?' | awk '{print int($1)==$1 ? $1 : int($1)+1}')
  gifski --quality 100 --extra --repeat=0 --width $width --height $height --fps $fps -o "output.gif" $1
}
