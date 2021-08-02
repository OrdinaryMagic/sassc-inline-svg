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

  s.required_ruby_version = ">= 2.0.0"

  s.require_paths   = ['lib']

  s.add_dependency 'sassc', '~> 2.0'

  s.add_development_dependency 'rspec', "~> 3.0"
  s.add_development_dependency 'simplecov', '0.17.1'
end
