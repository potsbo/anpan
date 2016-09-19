class Anpan
  GOOGLE_JAPANESE = {
      :vowels => {
          "a" => "a",   "o" => "o",   "e" => "e",   "u" => "u",   "i" => "i",
      },
      :consonants => {
          "" => {},
          "c" => {
              "output"=>"k",
              "contracted" => {"y" => "ily"},
              "geminated"  => {"c" => "ltuc"}
          },
          "s" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"s" => "ltus"}
          },
          "t" => {
              "contracted" => {"y" => "ily","h" => "ely"},
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
          "f" => {
              "output" => "hul",
              "geminated"  => {"f" => "ltuf"}
          },
          "r" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"r" => "ltur"}
          },
          "w" => {
              "contracted" => {"y" => "ul"},
              "geminated"  => {"r" => "ltur"}
          },
          "g" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"g" => "ltug"}
          },
          "z" => {
              "contracted" => {"y" => "ily"},
              "geminated"  => {"z" => "ltuz"}
          },
          "d" => {
              "contracted" => {"y" => "ely","h" => "ily"},
              "geminated"  => {"d" => "ltud"}
          },
          "v" => {
              "output"     => "p",
              "regression" => {"t" => "v","s" => "v"},
              "contracted" => {"y" => "ily"},
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
      },
      :symbols => {
          "[" => "[","]"=> "]","-"=>"-",","=>",","."=>".",
          "~" => "~"
      }
  }
end