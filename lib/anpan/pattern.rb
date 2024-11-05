require 'anpan/pattern/table'
require 'rexml/document'

class Anpan
  class Pattern
    attr_reader :input, :output, :addition
    def initialize(input, output = input, addition = nil, as_is = false)
      @input    = input
      @output   = output
      @addition = addition
      @as_is    = as_is
    end

    def render(target = :google_japanese_input)
      output = @as_is ? @output : output_jp

      case target
      when :google_japanese_input
        [@input, output, @addition].join("\t").gsub(/\t+$/, '')
      when :kawasemi
        # かわせみは自動で tt -> っt に変換してくれるのでそれを阻害しないようにする
        return [] unless @addition.empty?

        key = REXML::Element.new('key')
        key.text = @input
        value = REXML::Element.new('string')
        value.text = output
        [key, value]
      end
    end

    def to_h
      { input: @input, output: output_jp, addition: addition }
    end

    def output_jp
      calculate unless @output_jp
      @output_jp
    end

    def addition
      calculate unless @addition
      @addition
    end

    def calculate
      result     = search_table(@output)
      @output_jp = result[:jp]
      @addition  = result[:rest]
    end

    def search_table(rest)
      rest = rest.to_s
      (0..rest.length).each do |i|
        sym = rest[0..i].to_sym
        unless TABLE[sym].nil?
          result = search_table(rest[(i + 1)..-1])
          return { jp: TABLE[sym] + result[:jp], rest: result[:rest] }
        end
      end
      { jp: '', rest: rest }
    end
  end
end
