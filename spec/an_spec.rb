require 'spec_helper'

describe Anpan::An do
  let(:conf) { {} }
  let(:anpan) { Anpan::An.new(conf) }
  let(:consonant) { Anpan::Consonant.new(input: :c, output: :k) }
  let(:vowel) { Anpan::Vowel.new({input: :a}) }

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

    context 'when default conf loaded' do
      let(:conf) { Anpan::An::CONF }
      expected = [
          "a\tあ", "i\tい", "u\tう", "e\tえ", "o\tお",
          "ca\tか","ci\tき","cu\tく","ce\tけ","co\tこ",
          "ta\tた","ti\tち","tu\tつ","te\tて","to\tと",
          "na\tな","ni\tに","nu\tぬ","ne\tね","no\tの",
          "ha\tは","hi\tひ","hu\tふ","he\tへ","ho\tほ",
          "ma\tま","mi\tみ","mu\tむ","me\tめ","mo\tも",
          "fa\tや","fi\tい","fu\tゆ","fe\tえ","fo\tよ",
          "ra\tら","ri\tり","ru\tる","re\tれ","ro\tろ",
          "cna\tきゃ","cni\tきぃ","cnu\tきゅ","cne\tきぇ","cno\tきょ",
          "cn;\tきゃん","cnq\tきょん","cnj\tきぇん","cnk\tきゅん","cnx\tきぃん",
          "cc\tっ\tc",
          "wha\tうぁ","whi\tうぃ","whu\tうぅ","whe\tうぇ","who\tうぉ",
      ]
      # expected.each do |output|
      #   it "should contain #{output}" do
      #     expect(render).to include("#{output}\n")
      #   end
      # end
    end

    context 'when anpan conf given' do
      let(:conf) { Anpan::An::CONF }
      let(:lines) { File.readlines('spec/table/anpan.txt').map(&:chomp) }
      describe 'render covers anpan.txt' do
        File.open('spec/table/anpan.txt') do |file|
          file.each_line do |line|
            it "should contain '#{line}'" do
              expect(render.split("\n")).to include line.chomp
            end
          end
        end
      end

      describe "anpan.txt covers rendered" do
        Anpan::An.new(Anpan::An::CONF).render.split("\n").each do |pattern|
          it "should not contain '#{pattern}' if it's not on the table file" do
            expect(lines).to include pattern
          end
        end
      end
    end

    context 'when Google Japanese Input conf given' do
      let(:conf) { Anpan::An::GOOGLE_JAPANESE }
      let(:lines) { File.readlines('spec/table/google_japanese_input.txt').map(&:chomp) }
      describe 'render covers Google Japanese Input' do
        File.open('spec/table/google_japanese_input.txt') do |file|
          file.each_line do |line|
            it "should contain '#{line}'" do
              expect(render.split("\n")).to include line.chomp
            end
          end
        end
      end

      describe "Google Japanese Input covers rendered" do
        Anpan::An.new(Anpan::An::GOOGLE_JAPANESE).render.split("\n").each do |pattern|
          it "should not contain '#{pattern}' if it's not on the table file" do
            expect(lines).to include pattern
          end
        end
      end
    end
  end

  describe '#patterns' do
    let(:conf) { Anpan::An::CONF }
    it 'should have no alphabets in output_jp' do
      anpan.patterns.each do |pattern|
        expect(pattern.output_jp).not_to match(/[a-z]+/)
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
      expect(list.first.output).to eq :k
    end
  end

  describe '#load_consonants' do
    let(:list) { anpan.consonant_list }
    before do
      conf = [
        {
          input: :c,
          output: :k,
          vowel_filter: %i(a u o)
        },
        { input: :s }, { input: :t }
      ]
      anpan.load_consonant conf
    end
    context 'when conf size == 3' do
      it 'should return 3 consonants' do
        expect(list.size).to be 3
      end
      it 'should output "k"' do
        expect(list.first.output).to eq :k
      end
    end
  end

  describe '#vowel_list' do
    let(:list) { anpan.vowel_list }
    before do
      anpan.load_vowel([{input: :a}])
    end
    it 'should be an Array' do
      expect(list).to be_a Array
    end
    it 'should have one vowel' do
      expect(list.first).to be_a Anpan::Vowel
    end
    it 'should have one object' do
      expect(list.size).to be 1
    end
    it 'should have output "a"' do
      expect(list.first.output).to be :a
    end
  end

  describe '#table' do
    let(:table) { anpan.table }
    it 'should return an Array' do
      expect(table).to be_a Array
    end
  end

  describe '.table' do
    let(:table) { Anpan::An.table }
    it 'should return an Array' do
      expect(table).to be_a Array
    end
    it 'should return an Array' do
      expect(table.first).to be_a Hash
    end
    it 'should return hash with input, output, and addition keys' do
      expect(table.first.keys).to include(*%i(input output addition))
    end
  end
end
