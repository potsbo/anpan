class Anpan
  class Symbol
    attr_reader :input, :output

    def initialize(input, output, addition, as_is=false)
      @input    = input
      @output   = output
      @addition = addition
      @as_is    = as_is
    end

    def render
      pattern.render
    end

    def pattern
      Pattern.new(@input, @output, @addition, @as_is)
    end
  end
end
