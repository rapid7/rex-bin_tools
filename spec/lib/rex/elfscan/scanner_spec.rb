# -*- coding:binary -*-
require 'spec_helper'

require 'rex/elfscan/scanner'
require 'rex/elfparsey'

RSpec.describe Rex::ElfScan::Scanner do
  let(:elf) { instance_double(Rex::ElfParsey::Elf) }

  describe Rex::ElfScan::Scanner::JmpRegScanner do
    subject { described_class.new(elf) }

    describe '#config' do
      it 'creates a regex with NOENCODING for jmp reg patterns' do
        param = { 'args' => [0, 1, 2, 3, 5, 6, 7] }
        expect { subject.config(param) }.not_to raise_error
        expect(subject.regex).to be_a(Regexp)
        expect(subject.regex.encoding).to eq(Encoding::ASCII_8BIT)
      end
    end
  end

  describe Rex::ElfScan::Scanner::PopPopRetScanner do
    subject { described_class.new(elf) }

    describe '#config' do
      it 'creates a regex with NOENCODING for pop pop ret patterns' do
        param = {}
        expect { subject.config(param) }.not_to raise_error
        expect(subject.regex).to be_a(Regexp)
        expect(subject.regex.encoding).to eq(Encoding::ASCII_8BIT)
      end
    end
  end

  describe Rex::ElfScan::Scanner::RegexScanner do
    subject { described_class.new(elf) }

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
