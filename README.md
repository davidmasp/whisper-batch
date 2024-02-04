# Whisper Batch - Docker

1. Build the docker container

```
docker build . -t whisper-batch
```

This should take no more than a couple of minutes and you only need to run it once.

2. Create local structure

```
mkdir -p videos
mkdir -p transcripts
## put your videos and audios in the folder!
```

you can change the names of these folder to whatever you like.
Only put video/audio files in the videos folder!!

3. Run the docker container

```
pathtovideos=$(realpath ./videos)
pathtotranscripts=$(realpath ./transcripts)
docker run -v ${pathtovideos}:/videos -v ${pathtotranscripts}:/transcripts -t whisper-batch
```

4. Check the transcripts folders with the text files

## Notes

See [here](https://github.com/ggerganov/whisper.cpp/tree/master) for the
whisper cpp implementation

See [here](https://huggingface.co/ggerganov/whisper.cpp/tree/main) for the list of available models.

See [here](https://stackoverflow.com/questions/13358287/how-to-convert-any-mp3-file-to-wav-16khz-mono-16bit)
for how to obtain the right audio format.


