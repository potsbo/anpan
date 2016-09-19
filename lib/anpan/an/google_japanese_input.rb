class Anpan
  GOOGLE_JAPANESE = {
      :vowels => {
          "a" => "a",   "o" => "o",   "e" => "e",   "u" => "u",   "i" => "i",
      },
      :consonants => {
          "" => {},
          "ch" => {
              "output"=>"tily",
          },
          "cy" => {
              "output"=>"tily",
          },
          "c" => {
              "output"=>'k',
              "vowel_filter" => %w(a u o)
          },
          "k" => {
              "contracted" => {
                  "y" => "ily",
                  "w" => "ul"
              },
              "geminated"  => {"k" => "ltuk"}
          },
          "s" => {
              "contracted" => {
                  "y" => "ily",
                  "h" => "ily"
              },
              "geminated"  => {"s" => "ltus"}
          },
          "t" => {
              "contracted" => {
                  "y" => "ily",
                  "h" => "ely",
                  "s" => "ul",
                  "w" => "ol"
              },
              "geminated"  => {"t" => "ltut"}
          },
          "n" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"n" => "nn"},
              "single"     => "nn"
          },
          "h" => {
              "contracted" => {
                  "y" => "ily",
                  "w" => "ul"
              },
              "geminated"  => {"h" => "ltuh"}
          },
          "m" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"m" => "ltum"}
          },
          "y" => {
              "vowel_filter" => %w(a u o),
              "geminated"  => {"y" => "ltuy"}
          },
          "f" => {
              "output" => "hul",
              "contracted" => {"y" => "y"},
              "geminated"  => {"f" => "ltuf"}
          },
          "r" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"r" => "ltur"}
          },
          "w" => {
              "contracted" => {"h" => "ul"},
              "geminated"  => {"w" => "ltuw"},
          },
          "g" => {
              "contracted" => {
                  "y" => "ily",
                  "w" => "ul"
              },
              "geminated"  => {"g" => "ltug"}
          },
          "z" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"z" => "ltuz"}
          },
          "j" => {
              "output" => "zily",
              "contracted" => {"y" => ""},
              "geminated"  => {"j" => "ltuj"}
          },
          "d" => {
              "contracted" => {
                  "y" => "ily",
                  "w" => "ol",
                  "h" => "ely"
              },
              "geminated"  => {"d" => "ltud"}
          },
          "p" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"p" => "ltup"}
          },
          "v" => {
              "contracted" => {"y" => "uly"},
              "geminated"  => {"v" => "ltuv"},
          },
          "b" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"b" => "ltub"}
          },
          "l" => {
              "contracted" => {"y" => "y"},
              "geminated"  => {"l" => "ltul"}
          },
          "x" => {
              "output" => 'l',
              "contracted" => {"y" => "y"},
              "geminated"  => {"x" => "ltux"}
          },
          "q" => {
              "output" => "kul",
              "geminated"  => {"q" => "ltuq"}
          },
          "wy" => {
              "output" => "w",
              "vowel_filter" => %w(i e)
          },
          "lt" => {
              "output" => "lt",
              "vowel_filter" => %(u),
          }

      },
      :symbols => {
          "[" => "[","]"=> "]","-"=>"-",","=>",","."=>".",
          "~" => "~",
          "z-" => "~",
          "z/" => "/",
          "zj" => "↓", "zk" => "↑", "zh" => "←", "zl" => "→",
          "z[" => "z[", "z]" => "z]", "z." => '…', "z," => '‥'
      }
  }
end
