# Rbtclk

A light-weight timer application that can run in terminal emulators :rabbit:

![screenshot](https://raw.github.com/wiki/mozamimy/rbtclk/images/screenshot.gif)

## Requirement

- Ruby 2.0 or later.

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

Now we support only clock mode and countup mode.  
Countdown timer mode is our future works.

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

### Change font

This application depends on artii library (https://github.com/miketierney/artii).  
You can use any fonts that are supported by artii.

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

## Progress Report

- [x] Clock
- [x] Countup Timer
- [ ] Countdown Timer

## Code Status

- [![Build Status](https://travis-ci.org/mozamimy/rbtclk.svg?branch=master)](https://travis-ci.org/mozamimy/rbtclk)

## Contributing

1. Fork it ( https://github.com/mozamimy/rbtclk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
