require 'yaml'
require 'rexml/document'
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

  def render(target)
    case target
    when :google_japanese_input
      @an.patterns.map { |p| p.render(target) }.join("\n")
    when :kawasemi
      doc = REXML::Document.new
      doc << REXML::XMLDecl.new('1.0', 'UTF-8')
      plist = REXML::Element.new('plist')
      plist.add_attribute('version', '1.0')
      dict = REXML::Element.new('dict')

      @an.patterns.each do |p|
        p.render(target).each do |e|
          dict << e
        end
      end
      plist << dict
      doc << plist

      doc.to_s
    end
  end
end
