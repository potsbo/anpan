require 'rspec'

describe Consonant do
  let(:consonant) { Consonant.new('c',{"output"=>'k'}) }
  describe '#input' do
    it 'should return c for (\'c\',{"output"=>\'k\'})' do
      expect(consonant.input).to eq 'c'
    end
  end
end