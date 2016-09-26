require 'anpan/an/conf'
require 'anpan/an/google_japanese_input'

class Anpan::An
  attr_reader :consonant_list, :vowel_list
  def initialize(conf=CONF)
    @vowel_list     = []
    @consonant_list = []
    @symbol_list    = []
    load_conf(conf)
  end

  ### loading ###
  def load_conf(conf)
    load_consonant conf[:consonants]
    load_vowel     conf[:vowels]
    load_symbol    conf[:symbols]
  end

  def load_consonant(array = [])
    add_consonants (array||[]).map {|a| Anpan::Consonant.new a }
  end

  def load_vowel(array = [])
    add_vowels (array||[]).collect {|a| Anpan::Vowel.new a }
  end

  def load_symbol(array)
    add_symbols (array||{}).collect {|a| Anpan::Symbol.new(a[:input], a[:output] || a[:input], a[:addition], a[:as_is])}
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
    @patterns << @consonant_list.collect{|c| c.patterns @vowel_list}
    @patterns << @symbol_list.collect{|s| s.pattern}
    @patterns.flatten!
  end

  def patterns
    make_list unless @patterns && !@patterns.empty?
    @patterns
  end

  def render
    make_list
    @patterns.collect{|p| p.render}.join("\n")
  end
  ### rendering ###

  def table
    patterns.map { |pattern| pattern.to_h }
  end

  def self.table
    Anpan::An.new.table
  end
end
