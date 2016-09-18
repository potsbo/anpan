require 'spec_helper'

describe 'My behaviour' do
  let(:anpan) { Anpan.new }
  let(:consonant) { Consonant.new('c', {'output'=>'k'}) }
  let(:vowel) { Vowel.new('a', 'a') }

  before do
    anpan.add_consonants(consonant)
    anpan.add_vowels(vowel)
  end

  describe '#render' do
    let(:render) { anpan.render }

    it 'should renter "ca\tか"' do
      expect(render).to eq "ca\tか"
    end
  end

  describe '#consonant_list' do
    let(:list) { anpan.consonant_list }
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
end
