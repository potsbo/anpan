require 'spec_helper'

describe 'My behaviour' do
  let(:anpan) { Anpan.new }
  let(:consonant) { Consonant.new('c', {'output'=>'k'}) }
  let(:vowel) { Vowel.new('a', 'a') }

  describe '#render' do
    let(:render) { anpan.render }
    before do
      anpan.add_consonants(consonant)
      anpan.add_vowels(vowel)
    end

    it 'should renter "ca\tか"' do
      expect(render).to eq "ca\tか"
    end
  end
end