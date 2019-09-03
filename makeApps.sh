#!/bin/bash

if [ "$1" == "build" ]; then
	cd /tmp
	git clone https://github.com/jiahaog/nativefier.git
	cd nativefier
	docker build -t nativefier .
	exit
fi

mkdir -p compile
mkdir -p binaries
cp resources/icon.png compile
cp resources/dark.js compile
chmod a+rw compile -R
chmod a+rw binaries -R
rm -rf binaries/*
cd compile

## Light apps

# Linux
docker run -v "${PWD}":/target nativefier --name GoogleVoice -p linux https://voice.google.com /target/
mv google-voice-linux-x64 google-voice
tar cvfz google-voice-linux.tgz google-voice
mv google-voice-linux.tgz ../binaries

# Windows
docker run -v "${PWD}":/target jiahaog/nativefier --name GoogleVoice -i /target/icon.png -p windows https://voice.google.com /target/
mv GoogleVoice-win32-x64 GoogleVoice
zip -r GoogleVoice-win.zip GoogleVoice
mv GoogleVoice-win.zip ../binaries

# OSX
docker run -v "${PWD}":/target jiahaog/nativefier --name GoogleVoice -p osx https://voice.google.com /target/
cd GoogleVoice-darwin-x64
zip -r GoogleVoice-osx.app.zip GoogleVoice.app
mv GoogleVoice-osx.app.zip ../../binaries
cd ..

## Dark apps

# Linux
docker run -v "${PWD}":/target nativefier --name GoogleVoice -p linux --inject /target/dark.js https://voice.google.com /target/
mv google-voice-linux-x64 google-voice
tar cvfz google-voice-linux-dark.tgz google-voice
mv google-voice-linux-dark.tgz ../binaries

# Windows
docker run -v "${PWD}":/target jiahaog/nativefier --name GoogleVoice -i /target/icon.png -p windows --inject /target/dark.js https://voice.google.com /target/
mv GoogleVoice-win32-x64 GoogleVoice
zip -r GoogleVoice-win-dark.zip GoogleVoice
mv GoogleVoice-win-dark.zip ../binaries

# OSX
docker run -v "${PWD}":/target jiahaog/nativefier --name GoogleVoice -p osx --inject /target/dark.js https://voice.google.com /target/
cd GoogleVoice-darwin-x64
zip -r GoogleVoice-osx-dark.app.zip GoogleVoice.app
mv GoogleVoice-osx-dark.app.zip ../../binaries
cd ..

cd ..
rm -rf compile