# gdm-tools

This is a set of tools for Gnome's Display/Login Manager (GDM).

Currently, it includes only gdm-theme tool.

## gdm-theme

This is a command-line program which provides a nice interface to set GDM theme and background image.

## Installation

Before installing this program, make sure you have installed all the dependencies stated below.

### Method 1:

Download it in zip format by clicking on green 'Code' button on upper right corner of this page and then clicking on 'Download ZIP'. Extract it somewhere on your system. Open the extracted folder in terminal, type `./install` and press Enter. Now type your password and press Enter.

### Method 2:

First, make sure you have installed git. On Debian-like systems that can be done by running the command `sudo apt install git` in terminal.

Then, run following commands in terminal.

```bash
git clone https://github.com/realmazharhussain/gdm-tools.git
cd gdm-tools
./install.sh
```

## Dependencies

gdm-tools depends on following package:

1. GLib (Developer Edition)\
   it has different package names in different distros:\
   	Debian/Ubuntu: libglib2.0-dev\
   	Arch/Manjaro: glib2\
   	Fedora/CentOS: glib2-devel 

You can install these dependencies using package manager on terminal. For example, on Debian, Ubuntu and derivatives, you will need to run the following command in order to install the dependencies

```bash
sudo apt install libglib2.0-dev
```

## Usage

### gdm-theme

You can use gdm-theme as follows:

```bash
gdm-theme {Option} [theme] [image]
```

where option is one of the following:

| Option           | Function                               |
| :--------------- | :------------------------------------- |
| -l, list         | List all available valid GDM themes    |
| -s, set          | Set a specific theme and/or background |
| -h, help, --help | Display a short help message           |
| -e, examples     | Explain the commands with examples     |

