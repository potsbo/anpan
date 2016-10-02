require 'rspec'

describe Anpan::Vowel do
  describe '#input' do
    describe 'normal vowels'
    %i(a o e u i).each do |char|
      it "should return #{char}" do
        expect(Anpan::Vowel.new(input: char).input).to eq char
      end
    end

    describe 'special vowels' do
      {';' => 'ann', 'q' => 'onn', 'j' => 'enn',
       'k' => 'unn', 'x' => 'inn'}.each do |input,output|
        it "should return #{output} for #{input}" do
          vowel = Anpan::Vowel.new(input: input, output: output)
          expect(vowel.output).to eq output
        end
      end
    end
  end

  describe '#output' do
    %i(a o e u i).each do |char|
      it "should return #{char}" do
        expect(Anpan::Vowel.new(input: char).output).to eq char
      end
    end
  end
end