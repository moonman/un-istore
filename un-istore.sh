#!/bin/bash

## Needs ffmpeg and libmp4v2 packages

mkdir clean
ls *.m4a | while read f; do
        ffmpeg -i "$f" -acodec copy -vn "clean/$f" < /dev/null
        mp4art --extract "$f"
        mp4art --add "${f%.*}.art[0].jpg" "clean/$f"
        rm -f "${f%.*}.art[0].jpg"
done
