# pharo-snap

This builds a snapcraft package of the Pharo 6.0 Smalltalk VM using the latest stable V6.0 build.

SQLite3 libraries are included.

These notes assume that you are already familiar with Pharo.  If not, please visit the website at http://pharo.org/


## Compatibility

Pharo image 60442 or later is required for Cairo support.

Opening URL's in a browser on the host requires snapd-xdg-open to be installed on the host.  On Ubuntu based systems:

```bash
$ sudo apt-get install snapd-xdg-open
```


## Building the package

These instructions are for Ubuntu 16.04 and should work on later versions.

Ensure that snapcraft is installed and i386 is enabled:

```bash
$ sudo apt install snapcraft build-essential git
$ dpkg --add-architecture i386
```

More detailed instructions are available from: https://snapcraft.io/create/

Clone this repository and cd to the root directory (snapcraft.yaml is in this directory).

Build the package:

```bash
$ snapcraft
```

The output will be a file named pharo_(version)_amd64.snap.


## Install the package

The package is installed with:

```bash
sudo snap install --dangerous --devmode pharo_(version)_amd64.snap
```

Note:

* --dangerous is required since the package isn't signed.
* --devmode is required since the package needs access to your working directory.  (It should be possible to install this in strict mode, but it isn't working yet)

## Running the VM

The snap package provides the following commands:

* pharo - Run the image in headless mode
* pharo.ui - Run the image (with UI)
* pharo.newvm - Copy the clean Pharo image and changes file to the working directory.
* pharo.sqlite3 - Run the sqlite3 command line utility

