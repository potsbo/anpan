require 'rspec'

describe Anpan::Consonant do
  let(:consonant) { Anpan::Consonant.new(input: :c, output: :k) }
  describe '#input' do
    it 'should return c for (\'c\',{"output"=>\'k\'})' do
      expect(consonant.input).to eq :c
    end
  end

  describe '#patterns' do
    it 'should return an Array' do
      expect(consonant.patterns).to be_a Array
    end
    context 'when consonant "c" and vowel "a" given' do
      before do
        consonant.add_vowel(Anpan::Vowel.new(input: :a))
      end
      it 'should return a Pattern' do
        expect(consonant.patterns.first).to be_a Pattern
      end
      it 'should contain "か"' do
        expect(consonant.patterns.first.output_jp).to eq 'か'
      end
    end
  end
end