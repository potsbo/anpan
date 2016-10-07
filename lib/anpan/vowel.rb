class Anpan
  class Vowel
    attr_reader :input, :output
    def initialize(conf)
      @input  = conf[:input]
      @output = conf[:output] || conf[:input]
    end
  end
end
