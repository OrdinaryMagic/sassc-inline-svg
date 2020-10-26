# sassс-inline-svg

[![Gem Version](https://badge.fury.io/rb/sassc-inline-svg.svg)](https://badge.fury.io/rb/sassc-inline-svg)
[![Build Status](https://travis-ci.org/OrdinaryMagic/sassc-inline-svg.svg?branch=master)](https://travis-ci.org/OrdinaryMagic/sassc-inline-svg)
[![Maintainability](https://api.codeclimate.com/v1/badges/12d2b44eba163f7ca09e/maintainability)](https://codeclimate.com/github/OrdinaryMagic/sassc-inline-svg/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/12d2b44eba163f7ca09e/test_coverage)](https://codeclimate.com/github/OrdinaryMagic/sassc-inline-svg/test_coverage)

Inline url-encoded SVG with Sassc. Optional variable string replacement included!

Inspired by https://github.com/franzheidl/sass-inline-svg

## Installation

    gem install sassc-inline-svg

Add this line to your application's Gemfile:

    gem 'sassc-inline-svg'

## Usage

Sassc-inline-svg adds a `inline_svg` function you can use with Sass. It url-encodes the contents of the specified file and inlines it in your CSS (Url-encoded SVG is about 30% smaller than base64).


```css
.block {
  background: #0e4573 inline_svg('example.svg', (fillcolor: '#23b3e8')) no-repeat;
}
```
