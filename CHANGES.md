# Change Log

Note: This change log only documents changes to the packaging.

For changes to Pharo, please see the Pharo change logs:
https://github.com/pharo-project/pharo-changelogs

## 6.0.2

- Move to Pharo6 GA VM (6a63f68)
- 64 bit VM not yet tested

## 6.0.1

- Add FileAttributesPlugin source to snapcraft build
-- This is temporary until the plugin is either integrated in to the base system, or discarded.

## 6.0.0

- Rearrange directory structure
- Add snapcraft version-script
- Use gcc 4.8 (OSProcess doesn't work with gcc 5.4)

## 2.0.3

- Add FileAttributesPlugin
- 64 bit VM is unstable

## 2.0.2

- Refactor and improve image size detection

## 2.0.1

- Automatically distinguish between 32 and 64 bit images.
- Allow sources to be downloaded prior to snapcraft build
  Saves bandwidth and allows manually selecting the git checkout.

## 2.0.0

- Add 64bit VM to the snap package

## 1.3.1

- Rename getvm and cleanvm to getimage and cleanimage.

## 1.3.0

- Successfully running with classic confinement.

## 1.2.3

- Add desktop-glib-only to pharo part.
- Clone depth 1

## 1.2.1

- Extend build-packages and stage-packages
- Take local copy of pharo and pharo-ui launcher scripts
  (these will need to be removed later).

## 1.2.0

Start building the VM locally (instead of downloading the pre-built VM from get.pharo.org).

## 1.1.3

Add curl to the package, required for getimage.

## 1.0.1

Include locales-all package in snap to avoid "setlocale() failed" error
on startup.

## 1.0.0

Initial build
