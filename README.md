# pharo-snap

This builds a snapcraft package of the Pharo 6.0 Smalltalk threaded VM using the latest stable V6.0 build.

SQLite3 libraries are included.

These notes assume that you are already familiar with Pharo.  If not, please visit the website at http://pharo.org/

## Installing Pharo

Install Pharo in seconds on [Ubuntu and other snap supported Linux distributions](https://snapcraft.io/docs/core/install) with:

    snap install pharo --classic --edge

Installing a snap is very quick. They are isolated with all of their dependencies. Snaps also auto update when a new version is released.

Opening URL's in a browser on the host requires snapd-xdg-open to be installed on the host.  On Ubuntu based systems:

```bash
$ sudo apt-get install snapd-xdg-open
```

## Compatibility

Pharo image 60442 or later is required for Cairo support.


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
$ snapcraft clean; snapcraft
```

The output will be a file named pharo_(version)_amd64.snap.


## Install the package

The package is installed with:

```bash
sudo snap install --dangerous --classic pharo_(version)_amd64.snap
```

Note:

* --dangerous is required since the package isn't signed.
* --classic is required to allow Pharo to access any other program on your machine, i.e. when calling a subprocess.

## Running the VM

The snap package provides the following commands:

* pharo - Run the image in headless mode
* pharo.ui - Run the image (with UI)
* pharo.cleanimage - Copy the clean Pharo image and changes file to the working directory, i.e. the version current when this package was built.
* pharo.getimage - copies the latest 6.0 VM from http://get.pharo.org
* pharo.sqlite3 - Run the sqlite3 command line utility
* pharo.config - configures system thread priority, see below.

This Pharo VM uses a threaded heartbeat that requires elevated priority.
Permission is granted by creating /etc/security/limits.d/pharo.conf
with the appropriate contents.  Running pharo.config will create or
overwrite the configuration file.  This command must be run as root:

```bash
sudo pharo.config
```

This command only needs to be run once, and you must log out and 
back in for the changes to take effect.

A simple sequence to get started and check your image version:

```bash
# Create an empty directory to start in
cd ~
mkdir pharo6
cd pharo6
# Take a copy of a clean image
# You'll have two files after this: Pharo.image and Pharo.changes
pharo.cleanimage
# Start pharo
pharo.ui Pharo.image
#
# You can see the image version by clicking anywhere on the background
# and selecting System -> About...
#
```
