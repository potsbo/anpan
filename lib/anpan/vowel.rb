class Anpan
  class Vowel
    attr_reader :input, :output
    def initialize(conf)
      @input  = conf[:input]  || conf['input']
      @output = conf[:output] || conf['output'] || @input
    end
  end
end
