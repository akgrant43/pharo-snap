# Change Log

Note: This change log only documents changes to the packaging.

For changes to Pharo, please see the Pharo change logs:
https://github.com/pharo-project/pharo-changelogs

## 1.3.1

Rename getvm and cleanvm to getimage and cleanimage.

## 1.3.0

Successfully running with classic confinement.

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
