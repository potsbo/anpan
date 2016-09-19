class Anpan
  CONF = {
      :vowels => [
          {input: :a}, {input: :o}, {input: :e}, {input: :u}, {input: :i},
          {input: :"'", output: :ai}, {input: :',', output: :ou}, {input: :'.', output: :ei},
          {input: :p, output: :uu}, {input: :y, output: :ii},
          {input: :";", output: :ann}, {input: :q, output: :onn}, {input: :j, output: :enn},
          {input: :k, output: :unn}, {input: :x, output: :inn},
      ],
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
