# sassс-inline-svg

[![Gem Version](https://badge.fury.io/rb/sassc-inline-svg.svg)](https://badge.fury.io/rb/sassc-inline-svg)

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
