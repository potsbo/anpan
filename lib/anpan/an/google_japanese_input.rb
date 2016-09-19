class Anpan
  GOOGLE_JAPANESE = {
      :vowels => {
          "a" => "a",   "o" => "o",   "e" => "e",   "u" => "u",   "i" => "i",
      },
      :consonants => {
          "" => {},
          "c" => {
              "output"=>"t",
              "vowel_filter" => [],
              "contracted" => {
                  "h" => "ily",
                  "y" => "ily",
              },
              "geminated"  => {"c" => "ltuc"}
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
              "geminated"  => {"n" => "nn"}
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
              "geminated"  => {"y" => "ltuy"}
          },
          "f" => {
              "output" => "hul",
              "geminated"  => {"f" => "ltuf"}
          },
          "r" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"r" => "ltur"}
          },
          "w" => {
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
              "regression" => {"f" => "ly"},
              "geminated"  => {"l" => "ltul"}
          },
          "x" => {
              "output" => 'l',
              "geminated"  => {"x" => "ltux"}
          },
          "q" => {
              "output" => "kul",
              "geminated"  => {"q" => "ltuq"}
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
