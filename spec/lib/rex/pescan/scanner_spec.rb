# -*- coding:binary -*-
require 'spec_helper'

require 'rex/pescan/scanner'
require 'rex/peparsey'

RSpec.describe Rex::PeScan::Scanner do
  let(:pe) { instance_double(Rex::PeParsey::Pe) }

  describe Rex::PeScan::Scanner::JmpRegScanner do
    subject { described_class.new(pe) }

    describe '#config' do
      it 'creates a regex with NOENCODING for jmp reg patterns' do
        param = { 'args' => [0, 1, 2, 3, 5, 6, 7] }
        expect { subject.config(param) }.not_to raise_error
        expect(subject.regex).to be_a(Regexp)
        expect(subject.regex.encoding).to eq(Encoding::ASCII_8BIT)
      end
    end
  end

  describe Rex::PeScan::Scanner::PopPopRetScanner do
    subject { described_class.new(pe) }

    describe '#config' do
      it 'creates a regex with NOENCODING for pop pop ret patterns' do
        param = {}
        expect { subject.config(param) }.not_to raise_error
        expect(subject.regex).to be_a(Regexp)
        expect(subject.regex.encoding).to eq(Encoding::ASCII_8BIT)
      end
    end
  end

  describe Rex::PeScan::Scanner::RegexScanner do
    subject { described_class.new(pe) }

    describe '#config' do
      it 'creates a regex with NOENCODING from user-supplied pattern' do
        param = { 'args' => '\xcc' }
        expect { subject.config(param) }.not_to raise_error
        expect(subject.regex).to be_a(Regexp)
        expect(subject.regex.encoding).to eq(Encoding::ASCII_8BIT)
      end
    end
  end
end
