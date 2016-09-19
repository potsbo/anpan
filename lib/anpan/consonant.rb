class Consonant
  attr_reader :input, :output
  def initialize(input, conf)
    @input        = input
    @vowel_list   = []
    @patterns     = []
    @vowel_filter = []
    load_conf(conf)
  end

  def load_conf(conf)
    @input        = conf["input"]      || @input
    @output       = conf["output"]     || @input || @output
    @contraction  = conf["contracted"] || @contraction || []
    @gemination   = conf["geminated"]  || @gemination  || []
    @regression   = conf["regression"] || @regression  || []
    @vowel_filter = conf["vowel_filter"] || ['a', 'i', 'u', 'e', 'o']
  end

  def addVowel(vowel)
    @vowel_list << vowel
  end

  ### pattern makers ###
  def patterns(vowel_list=nil)
    @vowel_list = vowel_list || @vowel_list
    reset_all_patterns
  end

  def reset_all_patterns
    @patterns = []
    @patterns.push patterns_normal
    @patterns.push patterns_contracted
    @patterns.push patterns_geminated
    @patterns.push patterns_regression
    @patterns.flatten!
  end

  def patterns_normal
    vowels.collect { |v| Pattern.new(@input + v.input, @output + v.output)}
  end

  def patterns_contracted
    @contraction.collect do |trigger,insertion|
      @vowel_list.collect do |v|
        # insertion = "" if insertion[0] == v.output[0]
        Pattern.new(
          @input  + trigger   + v.input,
          @output + insertion + v.output)
      end
    end
  end

  def patterns_geminated
    @gemination.collect do |trigger,insertion|
      Pattern.new( @input + trigger, insertion)
    end
  end

  def patterns_regression
    @regression.collect do |trigger,output|
      @vowel_list.collect do |v|
        Pattern.new(
          @input + trigger + v.input,
          output + v.output)
      end
    end
  end

  def vowels
    @vowel_list.select { |v| @vowel_filter.include? v.output[0]}
  end
  ### pattern makers ###
end
