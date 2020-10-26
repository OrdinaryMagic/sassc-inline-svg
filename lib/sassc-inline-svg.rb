# encoding: UTF-8
# frozen_string_literal: true

require 'sassc-rails'
require 'cgi'

module SassC::InlineSVG
  module Functions
    def inline_svg(path, options = nil)
      svg = read_file(path.value.strip)
      svg = replace_options(svg, options)
      SassC::Script::Value::String.new(encode_url(svg))
    end

    private

    def read_file(path)
      if defined?(Rails) && Rails.application
        source = Rails.application.assets || ::Sprockets::Railtie.build_environment(Rails.application)
        asset = source.find_asset(path)
        raise "File not found or cannot be read (Sprockets): #{path}" if asset.nil?

        return asset.to_s
      end
      raise SassC::SyntaxError, "File not found or cannot be read (native): #{path}" unless File.readable?(path)

      File.open(path, 'rb') { |f| f.read }.strip
    end

    def replace_options(svg, options)
      return svg if options.nil?

      options.value.each_pair do |k, v|
        svg.gsub!(k.value, v.value) if svg.include?(k.value)
      end
      svg
    end

    def encode_url(svg)
      encoded = CGI::escape(svg).gsub("+", "%20")
      "url('data:image/svg+xml;charset=utf-8," + encoded + "')"
    end
  end
end

SassC::Script::Functions.include SassC::InlineSVG::Functions
