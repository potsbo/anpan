require 'rspec'

describe Pattern do
  let(:pattern) { Pattern.new('a','a') }
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

  describe 'TABLE' do
    it 'should not be nil' do
      expect(TABLE).not_to be_nil
    end
    it 'should have :a as a key' do
      expect(TABLE[:a]).not_to be_nil
    end
  end
end