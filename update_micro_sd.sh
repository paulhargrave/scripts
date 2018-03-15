#! /bin/sh

cd flac
find . -maxdepth 1 -mindepth 1 -printf '%P\n' -exec rsync -rltvv --delete desktop:/multimedia/flac/{} . \;
#find . -maxdepth 1 -exec rsync -rltvv --delete desktop:/multimedia/flac/{} {} \;
