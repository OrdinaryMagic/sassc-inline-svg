# encoding: UTF-8
# frozen_string_literal: true

require File.expand_path('../lib/sassc-inline-svg/version', __FILE__)

Gem::Specification.new do |s|
  s.name            = 'sassc-inline-svg'
  s.version         = SassC::InlineSVG::VERSION
  s.author          = 'Dmitry Leonov'
  s.email           = 'ordm67@gmail.com'
  s.summary         = 'Adds inline_svg as a Sass function.'
  s.description     = 'Adds inline_svg as a Sass function.'
  s.homepage        = 'https://github.com/OrdinaryMagic/sassc-inline-svg'
  s.license         = 'MIT'

  s.files           = `git ls-files -z`.split("\x0")
  s.test_files      = `git ls-files -z -- {test,spec,features}/*`.split("\x0")
  s.require_paths   = ['lib']

  s.add_dependency 'sassc-rails', '~> 2.0'
end