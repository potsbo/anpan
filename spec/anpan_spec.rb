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
    it 'should have 1 consonant' do
      expect(list).to be_a Array
    end
  end
end