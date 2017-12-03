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
      @conf = conf
      @inputs       = conf[:input]         || @inputs
      @outputs      = conf[:output]        || @inputs
      @vowel_filter = conf[:vowel_filter]  || %i(a o e u i)

      @inputs  = Array([@inputs]).flatten
      @outputs = Array([@outputs]).flatten
    end

    def add_vowel(vowel)
      @vowel_list << vowel
    end

    ### pattern makers ###
    def patterns(vowel_list = nil)
      @vowel_list = vowel_list || @vowel_list
      reset_all_patterns
    end

    def reset_all_patterns
      @patterns = @inputs.map do |input|
        @outputs.map do |output|
          @input = input
          @output = output
          [patterns_normal, patterns_single, patterns_contracted, patterns_germinated, patterns_regression]
        end
      end
      @patterns.flatten!
    end

    def patterns_normal
      vowels.collect { |v| Pattern.new("#{@input}#{v.input}", "#{@output}#{v.output}") }
    end

    def patterns_contracted
      (@conf[:contracted] || []).map do |c|
        vowels(c).collect do |v|
          Pattern.new(
            "#{@input}#{c[:trigger]}#{v.input}",
            "#{@output}#{c[:insertion]}#{v.output}"
          )
        end
      end
    end

    def patterns_germinated
      (@conf[:germinated] || []).map do |hash|
        trigger = hash[:trigger] || @input
        Pattern.new("#{@input}#{trigger}", "#{hash[:insertion]}#{trigger}")
      end
    end

    def patterns_regression
      (@conf[:regression] || []).collect do |a|
        vowels(a).collect do |v|
          Pattern.new(
            "#{@input}#{a[:trigger]}#{v.input}",
            "#{a[:insertion]}#{v.output}"
          )
        end
      end
    end

    def patterns_single
      single.map { |s| Pattern.new(@input, s) }
    end

    def single
      @conf[:single] || @conf['single'] || []
    end

    def vowels(conf = {})
      all_vs = filtered_vowels(conf)
      all_vs = all_vs.select { |v| v.input.to_s != @input.to_s } if avoid_self(conf)
      only_singles(conf) ? all_vs.select { |v| v.output.size <= 1 } : all_vs
    end

    def filtered_vowels(conf = {})
      @vowel_list.select { |v| vowel_filter(conf).include?(v.output[0].to_sym) }
    end

    def only_singles(conf = {})
      conf[:only_singles].nil? ? @conf[:only_singles] : conf[:only_singles]
    end

    def avoid_self(conf = {})
      conf[:avoid_self].nil? ? @conf[:avoid_self] : conf[:avoid_self]
    end

    def vowel_filter(conf = {})
      base  = conf[:vowels] || @vowel_filter
      base.map!{|s| s.to_sym}
      filter = conf[:vowel_filter] || %i(a o e u i)
      filter.map!{|s| s.to_sym}
      base &= filter
      base - Array(conf[:expect_vowels])
    end
    ### pattern makers ###
  end
end
