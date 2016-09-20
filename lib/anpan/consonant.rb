class Consonant
  attr_reader :input, :output
  def initialize(conf)
    @input        = conf[:input]
    @vowel_list   = []
    @patterns     = []
    @vowel_filter = []
    load_conf(conf)
  end

  def load_conf(conf)
    @input        = conf[:input]      || @input
    @output       = conf[:output]     || @input || @output
    @contraction  = conf[:contracted] || @contraction || []
    @germination  = conf[:germinated]  || @germination  || []
    @regression   = conf[:regression] || @regression  || []
    @vowel_filter = conf[:vowel_filter] || %i(a o e u i)
    @single       = Array(conf[:single]) || @single || []
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
    @patterns.push patterns_germinated
    @patterns.push patterns_regression
    @patterns.push patterns_single
    @patterns.flatten!
  end

  def patterns_normal
    vowels.collect { |v| Pattern.new("#{@input}#{v.input}", "#{@output}#{v.output}") }
  end

  def patterns_contracted
    @contraction.collect do |c|
      vowels(filter: c[:vowel_filter]).collect do |v|
        Pattern.new(
          "#{@input}#{c[:trigger]}#{v.input}",
          "#{@output}#{c[:insertion]}#{v.output}"
        )
      end
    end
  end

  def patterns_germinated
    @germination.map { |hash|
      Pattern.new("#{@input}#{hash[:trigger]}","#{hash[:insertion]}")
    }
  end

  def patterns_regression
    @regression.collect do |trigger,output|
      @vowel_list.collect do |v|
        Pattern.new(
          "#{@input}#{trigger}#{v.input}",
          "#{output}#{v.output}"
        )
      end
    end
  end

  def patterns_single
    @single.map { |s| Pattern.new(@input, s)}
  end

  def vowels(filter: nil)
    filter ||= %i(a o e u i)
    @vowel_list.select { |v| (@vowel_filter & filter).include?(v.output.to_s[0].to_sym) }
  end
  ### pattern makers ###
end
