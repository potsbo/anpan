require 'spec_helper'

describe Anpan do
  describe '.table' do
    let(:table) { Anpan.table }
    it 'should return an Array' do
      expect(table).to be_a Array
    end
    it 'should return an Array' do
      expect(table.first).to be_a Hash
    end
    it 'should return hash with input, output, and addition keys' do
      expect(table.first.keys).to include(*%i(input output addition))
    end
  end
end
