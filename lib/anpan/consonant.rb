class Anpan
  class Consonant
    attr_reader :inputs, :outputs
    def initialize(conf)
      @vowel_list   = []
      @patterns     = []
      @vowel_filter = []
      load_conf(conf)
    end

    def load_conf(conf)
      @inputs       = conf[:input]         || @inputs
      @outputs      = conf[:output]        || @inputs
      @contraction  = conf[:contracted]    || @contraction  || []
      @germination  = conf[:germinated]    || @germination  || []
      @regression   = conf[:regression]    || @regression   || []
      @vowel_filter = conf[:vowel_filter]  || %i(a o e u i)
      @only_singles = conf[:only_singles]  || false
      @avoid_self   = conf[:avoid_self]    || false
      @single       = Array(conf[:single]) || @single       || []

      @inputs  = Array([@inputs]).flatten
      @outputs = Array([@outputs]).flatten
    end

    def add_vowel(vowel)
      @vowel_list << vowel
    end

    ### pattern makers ###
    def patterns(vowel_list=nil)
      @vowel_list = vowel_list || @vowel_list
      reset_all_patterns
    end

    def reset_all_patterns
      @patterns = []
      @inputs.each do |input|
        @input = input
        @outputs.each do |output|
          @output = output
          @patterns << [
            patterns_normal, patterns_single, patterns_contracted,
            patterns_germinated, patterns_regression
          ]
        end
      end
      @patterns.flatten!
    end

    def patterns_normal
      vowels.collect { |v| Pattern.new("#{@input}#{v.input}", "#{@output}#{v.output}") }
    end

    def patterns_contracted
      @contraction.collect do |c|
        vowels(c).collect do |v|
          Pattern.new(
            "#{@input}#{c[:trigger]}#{v.input}",
            "#{@output}#{c[:insertion]}#{v.output}"
          )
        end
      end
    end

    def patterns_germinated
      @germination.map { |hash|
        trigger = hash[:trigger] || @input
        Pattern.new("#{@input}#{trigger}","#{hash[:insertion]}#{trigger}")
      }
    end

    def patterns_regression
      @regression.collect do |a|
        vowels(a).collect do |v|
          Pattern.new(
            "#{@input}#{a[:trigger]}#{v.input}",
            "#{a[:insertion]}#{v.output}"
          )
        end
      end
    end

    def patterns_single
      @single.map { |s| Pattern.new(@input, s)}
    end

    def vowels(conf = {})
      only_singles = conf[:only_singles].nil? ? @only_singles : conf[:only_singles]
      avoid_self   = conf[:avoid_self].nil?   ? @avoid_self   : conf[:avoid_self]
      base  = conf[:vowels] || @vowel_filter
      base &= conf[:vowel_filter]  || %i(a o e u i)
      base -= conf[:expect_vowels] || []
      all_vs = @vowel_list.select { |v| base.include?(v.output.to_s[0].to_sym) }
      all_vs = avoid_self ? all_vs.select { |v| v.input.to_s != @input.to_s } : all_vs
      only_singles ? all_vs.select { |v| v.output.to_s.size <= 1 } : all_vs
    end
    ### pattern makers ###
  end
end
