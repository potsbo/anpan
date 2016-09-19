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
end
