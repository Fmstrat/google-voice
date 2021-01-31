#!/usr/bin/env bash

if [ "$1" == "build" ]; then
	cd /tmp
	git clone https://github.com/jiahaog/nativefier.git
	cd nativefier
	docker build -t nativefier .
	exit
fi


sudo rm -rf compile binaries
mkdir -p compile
mkdir -p binaries
cp resources/* compile
chmod a+rw compile -R
chmod a+rw binaries -R
cd compile

## Light apps

# Linux
docker run -v "${PWD}":/target nativefier --name GoogleVoice -p linux --inject /target/light.js --user-agent "Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0" https://voice.google.com /target/
sudo chown $(id -u):$(id -g) . -R
mv GoogleVoice-linux-x64 google-voice
tar cvfz google-voice-linux.tgz google-voice
mv google-voice-linux.tgz ../binaries

# Windows
docker run -v "${PWD}":/target nativefier --name GoogleVoice -i /target/icon.png -p windows --inject /target/light.js --user-agent "Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0" https://voice.google.com /target/
sudo chown $(id -u):$(id -g) . -R
mv GoogleVoice-win32-x64 GoogleVoice
zip -r GoogleVoice-win.zip GoogleVoice
mv GoogleVoice-win.zip ../binaries

# OSX
docker run -v "${PWD}":/target nativefier --name GoogleVoice -p osx --inject /target/light.js --user-agent "Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0" https://voice.google.com /target/
sudo chown $(id -u):$(id -g) . -R
cd GoogleVoice-darwin-x64
zip -r GoogleVoice-osx.app.zip GoogleVoice.app
mv GoogleVoice-osx.app.zip ../../binaries
cd ..


## Dark apps

cd ..
sudo rm -rf compile
mkdir -p compile
cp resources/* compile
chmod a+rw compile -R
cd compile

# Linux
docker run -v "${PWD}":/target nativefier --name GoogleVoice -p linux --inject /target/dark.js --user-agent "Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0" https://voice.google.com /target/
sudo chown $(id -u):$(id -g) . -R
mv GoogleVoice-linux-x64 google-voice
tar cvfz google-voice-linux-dark.tgz google-voice
mv google-voice-linux-dark.tgz ../binaries

# Windows
docker run -v "${PWD}":/target nativefier --name GoogleVoice -i /target/icon.png -p windows --inject /target/dark.js --user-agent "Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0" https://voice.google.com /target/
sudo chown $(id -u):$(id -g) . -R
mv GoogleVoice-win32-x64 GoogleVoice
zip -r GoogleVoice-win-dark.zip GoogleVoice
mv GoogleVoice-win-dark.zip ../binaries

# OSX
docker run -v "${PWD}":/target nativefier --name GoogleVoice -p osx --inject /target/dark.js --user-agent "Mozilla/5.0 (Windows NT 10.0; rv:74.0) Gecko/20100101 Firefox/74.0" https://voice.google.com /target/
sudo chown $(id -u):$(id -g) . -R
cd GoogleVoice-darwin-x64
zip -r GoogleVoice-osx-dark.app.zip GoogleVoice.app
mv GoogleVoice-osx-dark.app.zip ../../binaries
cd ..

cd ..
sudo rm -rf compile
sudo chown $(id -u):$(id -g) binaries -R

