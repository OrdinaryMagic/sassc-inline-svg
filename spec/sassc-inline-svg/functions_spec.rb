# encoding: UTF-8
# frozen_string_literal: true

RSpec.describe 'Functions' do
  let(:dummy_class) { Class.new { extend SassC::InlineSVG::Functions } }
  let(:options) { nil }
  let(:path) { OpenStruct.new(value: file_path) }

  subject { dummy_class.inline_svg(path, options) }

  context 'when is this app without rails' do
    context 'when the file is found' do
      let(:file_path) { 'spec/support/files/example.svg' }

      context 'without options' do
        it 'returns encoded url' do
          expect(subject.value).to eq(File.read('spec/support/files/encoded_svg.txt'))
        end
      end

      context 'with options' do
        let(:options) { OpenStruct.new(value: { OpenStruct.new(value: 'fillcolor') => OpenStruct.new(value: '#0e4573')}) }

        it 'returns encoded url' do
          expect(subject.value).to eq(File.read('spec/support/files/encoded_svg_with_options.txt'))
        end
      end
    end

    context 'when the file is not found' do
      let(:file_path) { 'example.svg' }

      context 'when is this app without rails' do
        it 'returns encoded url' do
          expect { subject.value }.to raise_error('File not found or cannot be read (native): example.svg')
        end
      end
    end
  end

  context 'when is this a rails app' do
    before do
      stub_const 'Rails', OpenStruct.new(application: OpenStruct.new(assets: Class.new))
      allow(Rails.application.assets).to receive(:find_asset) { File.read(file_path) }
    end

    context 'when the file is found' do
      let(:file_path) { 'spec/support/files/example.svg' }

      context 'without options' do
        it 'returns encoded url' do
          expect(subject.value).to eq(File.read('spec/support/files/encoded_svg.txt'))
        end
      end

      context 'with options' do
        let(:options) { OpenStruct.new(value: { OpenStruct.new(value: 'fillcolor') => OpenStruct.new(value: '#0e4573')}) }

        it 'returns encoded url' do
          expect(subject.value).to eq(File.read('spec/support/files/encoded_svg_with_options.txt'))
        end
      end
    end

    context 'when the file is not found' do
      let(:file_path) { 'example.svg' }

      before do
        allow(Rails.application.assets).to receive(:find_asset) { nil }
      end

      context 'when is this app without rails' do
        it 'returns encoded url' do
          expect { subject.value }.to raise_error('File not found or cannot be read (Sprockets): example.svg')
        end
      end
    end
  end
end