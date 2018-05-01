cp -r $1 $1-flac
find $1-flac -name '*.wav' -exec bash -c 'flac $0 ${0/wav/flac}' {} \;
find $1-flac -name '*.wav' -exec rm -f {} \;

