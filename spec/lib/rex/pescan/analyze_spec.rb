# -*- coding:binary -*-
require 'spec_helper'

require 'rex/pescan/analyze'
require 'rex/peparsey'

RSpec.describe Rex::PeScan::Analyze::Fingerprint do
  let(:opt) { double('opt', AddressOfEntryPoint: 0) }
  let(:hdr) { double('hdr', opt: opt) }
  let(:pe)  { instance_double(Rex::PeParsey::Pe, hdr: hdr, read_rva: "MZ\x90\x00".b) }

  subject { described_class.new(pe) }

  let(:param) do
    {
      'database' => File.join(File.dirname(__FILE__), '..', '..', '..', '..', 'data', 'identify.txt'),
      'file'     => 'test.exe'
    }
  end

  describe '#config' do
    it 'loads signatures from the database without error' do
      expect { subject.config(param) }.not_to raise_error
    end
  end

  describe '#scan' do
    it 'matches signatures using Regexp with NOENCODING after config' do
      subject.config(param)
      expect { subject.scan(param) }.not_to raise_error
    end
  end
end
