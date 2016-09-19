require 'rspec'

describe Vowel do
  describe '#input' do
    describe 'normal vowels'
    %w(a o e u i).each do |char|
      it "should return #{char}" do
        expect(Vowel.new(char,char).input).to eq char
      end
    end

    describe 'special vowels' do
      {';' => 'ann', 'q' => 'onn', 'j' => 'enn',
       'k' => 'unn', 'x' => 'inn'}.each do |input,output|
        it "should return #{output} for #{input}" do
          expect(Vowel.new(input,output).output).to eq output
        end
      end
    end
  end

  describe '#output' do
    %w(a o e u i).each do |char|
      it "should return #{char}" do
        expect(Vowel.new(char,char).output).to eq char
      end
    end
  end
end