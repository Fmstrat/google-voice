# Google Voice with Light and Dark Themes

An electron wrapped Google Voice application with light and dark themes.

## Usage

Download the latest release from: https://github.com/Fmstrat/google-voice/releases

## Compiling yourself
Docker is required to build images.

Create the nativefier image for docker:
``` bash
./makeApps.sh build
```

Run the build:
``` bash
./makeApps.sh
```

## Ubuntu icon/shortcut
The `shortcuts/google-voice.desktop` file can be used as a shortcut from GNOME.

## Windows icon fix

If issues exist with the launch icon in Windows, use Rcedit from: https://github.com/electron/rcedit/releases
```
rcedit-x64.exe "C:\Program Files\GoogleVoice\GoogleVoice.exe" --set-icon icon.png
```
