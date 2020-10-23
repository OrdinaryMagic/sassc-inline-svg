# encoding: UTF-8
# frozen_string_literal: true

require 'sassc-rails'
require 'cgi'

module SassC::InlineSVG
  module Functions
    def svg_data_url(path)
      sprockets_context.depend_on_asset(path.value)
      svg = read_file(path.value.strip)
      SassC::Script::Value::String.new(encoded_url(svg))

    end

    private

    def encoded_url(svg)
      encoded = CGI::escape(svg).gsub("+", "%20")
      "url('data:image/svg+xml;charset=utf-8," + encoded + "')"
    end

    def read_file(path)
      if defined?(Rails)
        asset = (Rails.application.assets || ::Sprockets::Railtie.build_environment(Rails.application)).find_asset(path).to_s
        raise "File not found or cannot be read (Sprockets): #{path}" if asset.nil?

        return asset.to_s
      end
      raise SassC::SyntaxError, "File not found or cannot be read (native): #{path}" unless File.readable?(path)

      File.open(path, 'rb') { |f| f.read }.strip
    end
  end
end

SassC::Script::Functions.include SassC::InlineSVG::Functions
