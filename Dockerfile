FROM alpine:3.14

ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache ffmpeg git make build-base bash

RUN mkdir /models
RUN mkdir /src
RUN mkdir /work

WORKDIR /models
RUN wget https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-base.en.bin

WORKDIR /src
RUN git clone https://github.com/ggerganov/whisper.cpp.git
WORKDIR /src/whisper.cpp
RUN make

COPY runall.sh /work/runall.sh

WORKDIR /work
CMD ["bash", "runall.sh", "/videos"]
##  ffmpeg -i RPReplay_Final1706984375.MP4 -acodec pcm_s16le -ac 1 -ar 16000 out.wav
## /videos # /src/whisper.cpp/main -m /models/ggml-base.en.bin -l en -f out.wav -otxt -of out.txt 


