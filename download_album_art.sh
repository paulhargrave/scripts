#! /bin/bash

get_album_art () {
  current_dir=`pwd`
  echo "Getting album art for Artist: $1, Album: $2"

  uuid=`uuid`
  tmp_dir="/tmp/album-art/$uuid"
  mkdir -p $tmp_dir
  cd $tmp_dir

  glyrc cover --artist $1 --album $2 -n 1 
  feh ./*
  echo "Keep this one? (y = yes, u=enter URL, p=save as png, x=do nothing)"
  read keep
  if [ $keep = "y" ]
  then
    mv ./* /multimedia/flac/$1/$2/cover.jpg
  fi
  if [ $keep = "p" ]
  then
    mv ./* /multimedia/flac/$1/$2/cover.png
  fi
  if [ $keep = "u" ]
  then
    echo "Enter URL"
    read url
    cd /multimedia/flac/$1/$2/
    wget $url -O cover.jpg
  fi
  cd $current_dir


  
}


artists=`ls /multimedia/flac`

for artist in $artists
do
  albums=`ls /multimedia/flac/$artist`
  for album in $albums
  do
    echo "Artist :" $artist
    echo "Album :" $album
    nonflacs=`ls /multimedia/flac/$artist/$album | grep -v flac`
    echo "Non flac files are: $nonflacs"

    if [ -z $nonflacs ] 
    then 
      echo "There are no non-flac files. Do you want to download album art?"
      read download
      echo "You said $download"
      if [ $download = "y" ]
      then
        get_album_art $artist $album
      fi
    fi
  done
  echo
done




