cdrdao read-cd --datafile $1.bin --driver generic-mmc:0x20000 --device /dev/sr1 --read-raw $1.toc
toc2cue $1.toc $1.cue
