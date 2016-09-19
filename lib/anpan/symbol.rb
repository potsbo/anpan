class Anpan::Symbol
  attr_reader :input, :output
  def initialize(input, output)
    @input  = input
    @output = output
  end

  def render
    pattern.render
  end

  def pattern
    Pattern.new(@input,@output)
  end
end
