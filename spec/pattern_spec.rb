require 'rspec'

describe Anpan::Pattern do
  let(:pattern) { Anpan::Pattern.new('a', 'a') }
  describe '#render' do
    let(:render) { pattern.render }
    it 'should return string' do
      expect(render).to be_a String
    end
    it 'should return "a\tあ"' do
      expect(render).to eq "a\tあ"
    end
  end

  describe '#output_jp' do
    let(:jp) { pattern.output_jp }
    it 'should return string' do
      expect(jp).to be_a String
    end
    it 'should return "あ"' do
      expect(jp).to eq 'あ'
    end
  end

  describe '#to_h' do
    it 'should return a Hash' do
      expect(pattern.to_h).to be_a Hash
    end

    it 'should contain input, output, and addition' do
      expect(pattern.to_h.keys).to include(*%i(input output addition))
    end
  end

  describe 'TABLE' do
    it 'should not be nil' do
      expect(Anpan::Pattern::TABLE).not_to be_nil
    end
    it 'should have :a as a key' do
      expect(Anpan::Pattern::TABLE[:a]).not_to be_nil
    end
  end
end
