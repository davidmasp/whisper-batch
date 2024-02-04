#!/bin/bash

set -euo pipefail

dir=$1

for file in "$dir"/*; do
    # Remove directory path and extension from file name
    filename=$(basename -- "$file")
    filename="${filename%.*}"
    ffmpeg -i ${file} -acodec pcm_s16le -ac 1 -ar 16000 ${filename}.wav
    /src/whisper.cpp/main -m /models/ggml-base.en.bin -l en -f ${filename}.wav -otxt -of ${filename}
    mv ${filename}.txt /transcripts/${filename}.txt
    echo "${filename}.txt finished!"
done

