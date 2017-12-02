require 'spec_helper'

describe Anpan::An do
  let(:conf) { {} }
  let(:anpan) { Anpan::An.new(conf) }
  let(:consonant) { Anpan::Consonant.new(input: :c, output: :k) }
  let(:vowel) { Anpan::Vowel.new(input: :a) }

  describe 'config files' do
    let(:render) { anpan.render }
    config_files = {
      'anpan.txt': 'anpan.yaml',
      'google_japanese_input.txt': Anpan::An::GOOGLE_JAPANESE,
      'dvorakjp_prime.txt': Anpan::An::DVORAKJP,
    }
    config_files.each do |table, config|
      context "when #{table} given" do
        let(:conf) { config }
        let(:lines) { File.readlines("spec/table/#{table}").map(&:chomp) }
        describe "render covers #{table}" do
          File.open("spec/table/#{table}") do |file|
            rendered = Anpan::An.new(config).render.split("\n")
            file.each_line do |line|
              it "should contain '#{line}'" do
                expect(rendered).to include line.chomp
              end
            end
          end
        end

        describe 'uniqueness' do
          it 'Uniq by input should not appear twice' do
            rendered = Anpan::An.new(config).render.split("\n")
            uniq = rendered.uniq { |r| r.split("\t").first }
            expect(rendered - uniq).to eq []
          end
        end

        describe "#{table} covers rendered" do
          Anpan::An.new(config).render.split("\n").each do |pattern|
            it "should not contain '#{pattern}'" do
              expect(lines).to include pattern
            end
          end
        end
      end
    end
  end

  describe '#render' do
    let(:render) { anpan.render }
    context 'conf one consonant and one vowel added' do
      before do
        anpan.reset
        anpan.add_consonants(consonant)
        anpan.add_vowels(vowel)
      end
      it 'should renter "ca\tか"' do
        expect(render).to eq "ca\tか"
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
      anpan.reset
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
      expect(list.first.outputs).to eq [:k]
    end
  end

  describe '#load_consonants' do
    let(:list) { anpan.consonant_list }
    before do
      anpan.reset
      conf = [
        {
          input: :c,
          output: :k,
          vowel_filter: %i(a u o),
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
        expect(list.first.outputs).to eq [:k]
      end
    end
  end

  describe '#vowel_list' do
    let(:list) { anpan.vowel_list }
    before do
      anpan.reset
      anpan.load_vowel([{ input: :a }])
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
      expect(table.first.keys).to include :input, :output, :addition
    end
  end
end
