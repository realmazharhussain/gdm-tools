# gdm-tools

This is a set of tools for Gnome's Display/Login Manager (GDM).

Currently, it includes only 'gdm-theme' tool and 'gnomeconf2gdm'.

## gnomeconf2gdm

A script that gets Settings from Gnome Desktop and applies them to GDM

## gdm-theme

This is a command-line program which provides a nice interface to set GDM theme and background image.

#### Features:

- Set GDM theme and background
- Manage backup of the default GDM theme
- Extract default theme to be able to use it in weird gnome sessions such as Ubuntu
- Reset everything to its original form

# Installation

Before installing this program, make sure you have installed all the dependencies stated below in **Dependencies** section.

### Method 1:

Download it in zip format by clicking on green 'Code' button on upper right corner of this page and then clicking on 'Download ZIP'. Extract it somewhere on your system. Open the extracted folder in terminal, type `./install` and press Enter. Now type your password and press Enter.

### Method 2:

First, make sure you have installed git. On Debian-like systems that can be done by running the command `sudo apt install git` in terminal.

Then, run following commands in terminal.

```bash
git clone --depth=1 https://github.com/realmazharhussain/gdm-tools.git
cd gdm-tools
./install.sh
```

## Dependencies

gdm-tools depends on following package:

1. GLib 2.0 (Developer Edition)

   it has different package names in different distros\
   Debian/Ubuntu: libglib2.0-dev\
   Arch/Manjaro: glib2\
   Fedora/CentOS: glib2-devel 

2. DConf (Command-Line Version)

   it has different package names in different distros\
   Debian/Ubuntu: dconf-cli\
   Arch/Manjaro: dconf\
   Fedora/CentOS: dconf

You can install these dependencies using package manager on terminal.

For example, on Debian, Ubuntu and derivatives, you will need to run the following command in order to install the dependencies

```bash
sudo apt install libglib2.0-dev dconf-cli
```

On Arch/Manjaro

```bash
sudo pacman -S glib2 dconf 
```



## Usage

### gnomeconf2gdm

gnomeconf2gdm can be used as follows:

```bash
gnomeconf2gdm [option]
```

where option is one of the following:

| Option           | Function                      |
| ---------------- | ----------------------------- |
| {no option}      | Apply settings to GDM         |
| -r, reset        | Reset GDM settings to default |
| -h, help, --help | Show help message             |

### gdm-theme

You can use gdm-theme as follows:

```bash
gdm-theme {Option} [theme] [image]
```

where option is one of the following:

| Option           | Function                                       |
| :--------------- | :--------------------------------------------- |
| -l, list         | List all available valid GDM themes            |
| -s, set          | Set a specific theme and/or background         |
| -r, reset        | Reset everything to the original state         |
| -b, backup       | Manage backup of the default GDM theme         |
| -x, extract      | Extract default GDM theme for use inside gnome |
| -h, help, --help | Display a short help message                   |
| -e, examples     | Explain the commands with examples             |

#### Examples:

```bash
gdm-theme list
gdm-theme set
gdm-theme -s default ~/cat.jpg
gdm-theme set Yaru-dark
gdm-theme reset
gdm-theme -b update
gdm-theme backup restore
gdm-theme extract
```

## FAQ:

1. When I try to set default GDM theme using `gdm-theme` tool, it sets some other theme instead of the default theme. What should I do?

   **Ans:** You should reinstall the package `gnome-shell-common` and then run `gdm-theme backup update`. This will fix the issue.

2. Why does that happen?

   **Ans:** That could happen if you use some other program to set GDM theme before using `gdm-theme` tool. More information is available in *WARNING* section of `gdm-theme(1)` man page. To read it, install `gdm-tools` and then run the command `man 1 gdm-theme` on the terminal. When man page shows up, type `/warning` and press enter. This will take you straight to the warning section of man page.

## Contribute

If you like the project and want to contribute, you can do so by providing feedback or directly contributing code to it. To provide feedback, you can open an issue on github. If you don't know how to do that you can email me directly at mmazharhussainkgb1145@gmail.com.

You can also contribute on [Patreon](https://www.patreon.com/mazharhussain).

