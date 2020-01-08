#!/bin/sh
echo "---------- Install ffmpeg ----------"
if [ ! -d "/opt" ]; then
  mkdir /opt
fi

if [ ! -d "/opt/ffmpeg" ]; then
  mkdir /opt/ffmpeg
fi

cd /opt/ffmpeg
install wget
apt install wget
wget https://johnvansickle.com/ffmpeg/builds/ffmpeg-git-amd64-static.tar.xz
tar xvf ./ffmpeg-git-amd64-static.tar.xz --strip-components=1
ln -s /opt/ffmpeg/ffmpeg /usr/bin/ffmpeg
ln -s /opt/ffmpeg/ffmpeg /usr/bin/ffprobe
