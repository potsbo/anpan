require 'anpan/pattern/table'

class Pattern
  attr_reader :input, :output, :addition
  def initialize(input, output=input, addition = nil)
    @input    = input
    @output   = output
    @addition = addition
  end

  def render
    [@input,output_jp,@addition].join("\t").gsub(/\t+$/,'')
  end

  def output_jp
    jp, @addition = search_table(@output)
    jp
  end

  def search_table(rest)
    rest = rest.to_s
    (0..rest.length).each do |i|
      sym = rest[0..i].to_sym
      unless TABLE[sym].nil? then
        jp, rest = search_table(rest[(i+1)..-1])
        return TABLE[sym]+jp, rest
      end
    end
    return "", rest
  end
end
