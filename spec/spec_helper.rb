# encoding: UTF-8
# frozen_string_literal: true

require 'bundler/setup'
require 'sassc-inline-svg'
require 'simplecov'
SimpleCov.start

RSpec.configure do |config|
  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
