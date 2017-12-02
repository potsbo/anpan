class Anpan
  class Symbol
    attr_reader :input, :output

    def initialize(conf)
      @input    = conf[:input]    || conf['input']
      @output   = conf[:output]   || conf['output']   || @input
      @addition = conf[:addition] || conf['addition']
      @as_is    = conf[:as_is]    || conf['as_is']    || false
    end

    def render
      pattern.render
    end

    def pattern
      Pattern.new(@input, @output, @addition, @as_is)
    end
  end
end
