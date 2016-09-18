require 'spec_helper'

describe 'My behaviour' do
  let(:anpan) { Anpan.new }
  let(:consonant) { Consonant.new('c', {'output'=>'k'}) }
  let(:vowel) { Vowel.new('a', 'a') }

  describe '#render' do
    let(:render) { anpan.render }
    context 'conf one consonant and one vowel added' do
      before do
        anpan.add_consonants(consonant)
        anpan.add_vowels(vowel)
      end
      it 'should renter "ca\tか"' do
        expect(render).to eq "ca\tか"
      end
    end
  end

  describe '#consonant_list' do
    let(:list) { anpan.consonant_list }
    before do
      anpan.add_consonants(consonant)
      anpan.add_vowels(vowel)
    end
    it 'should be an Array' do
      expect(list).to be_a Array
    end
    it 'should have one consonant' do
      expect(list.size).to be 1
    end
    it 'should output "k"' do
      expect(list.first.output).to eq 'k'
    end
  end

  describe '#load_consonants' do
    let(:list) { anpan.consonant_list }
    before do
      conf = {
          "c" => {"output"=>"k"},
          "s" => {},
          "t" => {}
      }
      anpan.load_consonant conf
    end
    context 'when conf size == 3' do
      it 'should return 3 consonants' do
        expect(list.size).to be 3
      end
      it 'should output "k"' do
        expect(list.first.output).to eq 'k'
      end
    end
  end

  describe '#vowel_list' do
    let(:list) { anpan.vowel_list }
    before do
      anpan.load_vowel("a"=>"a")
    end
    it 'should be an Array' do
      expect(list).to be_a Array
    end
    it 'should have one vowel' do
      expect(list.first).to be_a Vowel
    end
    it 'should have one object' do
      expect(list.size).to be 1
    end
    it 'should have output "a"' do
      expect(list.first.output).to eq 'a'
    end
  end
end
