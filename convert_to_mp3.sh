cp -r $1 $1-mp3
find $1-mp3 -name '*.flac' -exec bash -c 'ffmpeg -i $0 -codec:a libmp3lame -qscale:a 5 ${0/flac/mp3}' {} \;
find $1-mp3 -name '*.flac' -exec rm -f {} \;

