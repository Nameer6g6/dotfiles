#!/bin/sh


[ ! -f "$2" ] && printf "The first file should be the audio, the second should be the timecodes.\\n" && exit

echo "Enter the album/book title:"; read -r booktitle

echo "Enter the artist/author:"; read -r author

echo "Enter the publication year:"; read -r year

inputaudio="$1"
