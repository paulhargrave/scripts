shntool join *.flac
flac --best joined.wav
mv joined.flac ../$1-$2.flac
rm *.flac *.wav
