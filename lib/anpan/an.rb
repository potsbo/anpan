require 'anpan/an/conf'
require 'anpan/an/google_japanese_input'
require 'anpan/an/dvorakjp'

class Anpan
  class An
    attr_reader :consonant_list, :vowel_list
    def initialize(conf = {})
      config = conf
      config = YAML.load_file(File.join(__dir__, 'an', conf)) if conf.is_a? String
      config = CONF if conf.empty?
      reset
      load_conf(config)
    end

    def reset
      @vowel_list     = []
      @consonant_list = []
      @symbol_list    = []
    end

    ### loading ###
    def load_conf(conf)
      load_consonant conf[:consonants]
      load_vowel     conf[:vowels]
      load_symbol    conf[:symbols]
    end

    def load_consonant(array = [])
      add_consonants array.map { |a| Anpan::Consonant.new a }
    end

    def load_vowel(array = [])
      add_vowels array.map { |a| Anpan::Vowel.new a }
    end

    def load_symbol(array = {})
      add_symbols array.map { |a| Anpan::Symbol.new(a[:input], a[:output] || a[:input], a[:addition], a[:as_is]) }
    end
    ### loading ###

    ### adding ###
    def add_consonants(consonants)
      @consonant_list.push(consonants).flatten!
    end

    def add_vowels(vowels)
      @vowel_list.push(vowels).flatten!
    end

    def add_symbols(symbols)
      @symbol_list.push(symbols).flatten!
    end
    ### adding ###

    ### rendering ###
    def make_list
      @patterns = []
      @patterns << @consonant_list.map { |c| c.patterns @vowel_list }
      @patterns << @symbol_list.map(&:pattern)
      @patterns.flatten!
      @patterns = @patterns.reverse.uniq { |p| p.input.to_sym }.reverse
    end

    def patterns
      @patterns && !@patterns.empty? ? @patterns : make_list
    end

    def render
      make_list
      @patterns.map(&:render).join("\n")
    end
    ### rendering ###

    def table(_ = {})
      patterns.map(&:to_h)
    end

    def self.table(args = {})
      Anpan::An.new.table(args)
    end
  end
end
