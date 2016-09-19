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
end
