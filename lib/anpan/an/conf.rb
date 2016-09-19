class Anpan
  CONF = {
      :vowels => {
          "a" => "a",   "o" => "o",   "e" => "e",   "u" => "u",   "i" => "i",
          "'" => "ai",  "," => "ou",  "." => "ei",  "p" => "uu",  "y" => "ii",
          ";" => "ann", "q" => "onn", "j" => "enn", "k" => "unn", "x" => "inn"
      },
      :consonants => {
          "" => {},
          "c" => {
              "output"=>"k",
              "contracted" => {"n" => "ily"},
              "geminated"  => {"c" => "ltuc"}
          },
          "s" => {
              "contracted" => {"h" => "ily"},
              "geminated"  => {"s" => "ltus"}
          },
          "t" => {
              "contracted" => {"n" => "ily","h" => "ely"},
              "geminated"  => {"t" => "ltut"}
          },
          "n" => {
              "contracted" => {"h" => "ily"},
              "geminated"  => {"n" => "nn"}
          },
          "h" => {
              "contracted" => {"n" => "ily"},
              "geminated"  => {"h" => "ltuh"}
          },
          "m" => {
              "contracted" => {"n" => "ily"},
              "geminated"  => {"m" => "ltum"}
          },
          "f" => {
              "output"     => "y",
              "regression" => {"t" => "f","s" => "f","n"=>"huly"},
              "geminated"  => {"f" => "ltuf"}
          },
          "r" => {
              "contracted" => {"h" => "ily"},
              "geminated"  => {"r" => "ltur"}
          },
          "w" => {
              "contracted" => {"h" => "ul"},
              "geminated"  => {"r" => "ltur"}
          },
          "g" => {
              "contracted" => {"n" => "ily"},
              "geminated"  => {"g" => "ltug"}
          },
          "z" => {
              "contracted" => {"h" => "ily"},
              "geminated"  => {"z" => "ltuz"}
          },
          "d" => {
              "contracted" => {"n" => "ely","h" => "ily"},
              "geminated"  => {"d" => "ltud"}
          },
          "v" => {
              "output"     => "p",
              "regression" => {"t" => "v","s" => "v"},
              "contracted" => {"h" => "ily"},
              "geminated"  => {"v" => "ltuv"},
          },
          "b" => {
              "contracted" => {"n" => "ily"},
              "geminated"  => {"b" => "ltub"}
          },
          "l" => {
              "regression" => {"f" => "ly"},
              "geminated"  => {"l" => "ltul"}
          },
      },
      :symbols => {
          "[" => "[","]"=> "]","-"=>"-","l,"=>",","l."=>"."
      }
  }
end
