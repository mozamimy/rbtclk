# Rbtclk

A light-weight timer application that can run in terminal emulators :rabbit:

![screenshot](https://raw.github.com/wiki/mozamimy/rbtclk/images/screenshot.gif)

## Requirement

- Ruby 2.0 or later.
- afplay or mpg123

This application is tested on OS X 10.10 and Arch Linux.

Rbtclk needs a sound player tool like afplay or mpg123.  
OS X has normally afplay as default.  
If you use other UNIX like system, you should install mpg123.

On Arch Linux,

```shell
$ sudo pacman -S mpg123
```

Rbtclk works without sound player tools, but alerming by sound file is disabled.

## Installation

```shell
$ (sudo) gem install 'rbtclk'
```

## Usage

### Basic usage

```shell
$ rbtclk
```

```
    ##    ######            ######    ####                ##      ###
   ###    ##         ##     ##       ##  ##     ##       ###     ##
    ##    #####      ##     #####    ##  ##     ##      ####    ##
    ##        ##                ##   ##  ##            ## ##    #####
    ##        ##                ##   ##  ##            ######   ##  ##
    ##    ##  ##     ##     ##  ##   ##  ##     ##        ##    ##  ##
    ##     ####      ##      ####     ####      ##       ####    ####
```

### Mode

This application supports some modes; clock, countup and countdown.  

#### Example

```shell
$ rbtclk --mode clock
$ rbtclk -m clock
```

```
    ##    ######            ######    ####                ##      ###
   ###    ##         ##     ##       ##  ##     ##       ###     ##
    ##    #####      ##     #####    ##  ##     ##      ####    ##
    ##        ##                ##   ##  ##            ## ##    #####
    ##        ##                ##   ##  ##            ######   ##  ##
    ##    ##  ##     ##     ##  ##   ##  ##     ##        ##    ##  ##
    ##     ####      ##      ####     ####      ##       ####    ####
```

```shell
$ rbtclk --mode countup
$ rbtclk -m countup
```

```
  ####     ####              ####     ####                ##     ####
 ##  ##   ##  ##     ##     ##  ##   ##  ##     ##       ###    ##  ##
 ##  ##   ##  ##     ##     ##  ##   ##  ##     ##        ##        ##
 ##  ##   ##  ##            ##  ##   ##  ##               ##      ###
 ##  ##   ##  ##            ##  ##   ##  ##               ##        ##
 ##  ##   ##  ##     ##     ##  ##   ##  ##     ##        ##    ##  ##
  ####     ####      ##      ####     ####      ##        ##     ####
```

```shell
$ rbtclk --mode countdown --time 90
$ rbtclk -m countdown --time 90
```

```
  ####     ####              ####       ##              ####     ####
 ##  ##   ##  ##     ##     ##  ##     ###      ##     ##  ##   ##  ##
 ##  ##   ##  ##     ##     ##  ##      ##      ##         ##   ##  ##
 ##  ##   ##  ##            ##  ##      ##               ###    ##  ##
 ##  ##   ##  ##            ##  ##      ##                 ##   ##  ##
 ##  ##   ##  ##     ##     ##  ##      ##      ##     ##  ##   ##  ##
  ####     ####      ##      ####       ##      ##      ####     ####
```

When remaining time reaches 0, rbtclk produces a sound to alert.  
This function is experimental!  
You can use this feature on only OS X.

### Change font

This application depends on artii library (https://github.com/miketierney/artii).  
You can use any fonts are supported by artii.

#### Example

```shell
$ rbtclk --font clb8x8 # default
```

```
    ##    ######            ######    ####                ##      ###
   ###    ##         ##     ##       ##  ##     ##       ###     ##
    ##    #####      ##     #####    ##  ##     ##      ####    ##
    ##        ##                ##   ##  ##            ## ##    #####
    ##        ##                ##   ##  ##            ######   ##  ##
    ##    ##  ##     ##     ##  ##   ##  ##     ##        ##    ##  ##
    ##     ####      ##      ####     ####      ##       ####    ####
```

```shell
$ rbtclk --font univers
```

```
    88  8888888888        8888888888     ad8888ba,          ,a8888a,       ad8888ba,
  ,d88  88                88            8P'    "Y8        ,8P"'  `"Y8,    8P'    "Y8
888888  88  ____          88  ____     d8                ,8P        Y8,  d8
    88  88a8PPPP8b,  888  88a8PPPP8b,  88,dd888bb,  888  88          88  88,dd888bb,
    88  PP"     `8b  888  PP"     `8b  88P'    `8b  888  88          88  88P'    `8b
    88           d8                d8  88       d8       `8b        d8'  88       d8
    88  Y8a     a8P  888  Y8a     a8P  88a     a8P  888   `8ba,  ,ad8'   88a     a8P
    88   "Y88888P"   888   "Y88888P"    "Y88888P"   888     "Y8888P"      "Y88888P"
```

```shell
$ rbtclk --font smkeyboard
```

```
 ____ ____ ____ ____ ____ ____ ____ ____
||1 |||5 |||: |||5 |||6 |||: |||4 |||6 ||
||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|
```

### Specify format

You can specify format of time by Time#strftime style.  
Default format is "%X".

#### Example

```shell
$ rbtclk --format "* %H:%M *"
```

```
    #                 ##      ###              ####       ##                #
    #                ###     ##        ##     ##  ##     ###                #
 ## # ##              ##    ##         ##     ##  ##    ####             ## # ##
   ###                ##    #####             ##  ##   ## ##               ###
    #                 ##    ##  ##            ##  ##   ######               #
   # #                ##    ##  ##     ##     ##  ##      ##               # #
  #   #               ##     ####      ##      ####      ####             #   #
```

### Enable color

Rbtclk can show clock with ANSI colors.  
Black(default), red, green, yellow, blue, magenta, cyan and white are available.

#### Example

```shell
$ rbtclk -c magenta
$ rbtclk --color magenta
```

## Configuration by .rbtclk file

The default behavior can be changed by `~/.rbtclk` file.  
Sample config file is in `RBTCLK_ROOT/config/default.rb`.

```ruby
Rbtclk.configure do |c|
  # clock, countup and countdown are available.
  c.mode = "clock"

  # Font setting depends on Artii library.
  # https://github.com/miketierney/artii/tree/master/lib/figlet/fonts
  # You can use a lot of font types.
  c.font = "clb8x8"

  # You can use Ruby's Date#strftime style.
  # It is compatible with strftime(3) of standard C library.
  c.format = "%X"

  # black, red, green, yellow, blue, magenta, cyan and white are available.
  c.color = "black"

  # You can specify limit time as seconds in countdown timer.
  c.time = "180"

  # The alarm sound is suppressed if no_alarm is true.
  c.no_alarm = false
end
```

## Progress Report

- [x] Clock
- [x] Countup Timer
- [x] Countdown Timer
- [x] Configuration by ~/.rbtclk
- [x] Sound
- [x] Sound on Linux/BSD
- [ ] Create AUR package for Arch Linux
- [ ] Controlling sound by command line options
- [ ] Refactoring

## Code Status

- [![Build Status](https://travis-ci.org/mozamimy/rbtclk.svg?branch=master)](https://travis-ci.org/mozamimy/rbtclk)

## Contributing

1. Fork it ( https://github.com/mozamimy/rbtclk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Special Thanks!
Alert sound is distributed by [Taira Komori](http://taira-komori.jpn.org/freesounden.html).
Thanks!
