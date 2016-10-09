require 'yaml'
require 'anpan/vowel'
require 'anpan/consonant'
require 'anpan/an'
require 'anpan/symbol'
require 'anpan/pattern'

class Anpan
  def self.table(args = {})
    An.table(args)
  end

  def initialize(args = {})
    @an = An.new(args)
  end

  def table(args = {})
    @an.table(args)
  end
end
