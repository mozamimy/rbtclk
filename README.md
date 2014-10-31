# Rbtclk

The light-weight timer application that can run in terminal.

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

### Mode

Now we support only a clock mode.  
Countdown timer mode and countup timer mode are our future works.

#### Example

```shell
$ rbtclk --mode clock
$ rbtclk -m clock
```

### Change font

This application depends on artii library (https://github.com/miketierney/artii).  
You can use any fonts that are supported by artii.

#### Example

```shell
$ rbtclk --font clb8x8 # default
$ rbtclk --font univers
$ rbtclk --font doh
$ rbtclk --font smkeyboard
```

## Contributing

1. Fork it ( https://github.com/mozamimy/rbtclk/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
