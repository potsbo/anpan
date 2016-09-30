class Anpan::An
  DVORAKJP = {
    :vowels => [
      {input: :a}, {input: :o}, {input: :e}, {input: :u}, {input: :i},
      {input: :"'", output: :ai}, {input: :',', output: :ou}, {input: :'.', output: :ei},
      {input: :p, output: :uu}, {input: :y, output: :ii},
      {input: :";", output: :ann}, {input: :q, output: :onn}, {input: :j, output: :enn},
      {input: :k, output: :unn}, {input: :x, output: :inn},
    ],
    consonants: [
      { input: nil },
      {
        input: :c,
        output: :k,
        contracted: [
          {trigger: :n, insertion: :ily}
        ],
        germinated: [
          {trigger: :c, insertion: :ltuc}
        ]
      },
      {
        input: :s,
        contracted: [
          {trigger: :h, insertion: :ily}
        ],
        germinated: [
          {trigger: :s, insertion: :ltus}
        ]
      },
      {
        input: :t,
        contracted: [
          {trigger: :n, insertion: :ily},
          {trigger: :h, insertion: :ely},
        ],
        germinated: [
          {trigger: :t, insertion: :ltut}
        ]
      },
      {
        input: :n,
        contracted: [
          {trigger: :h, insertion: :ily},
        ],
        germinated: [
          {trigger: :n, insertion: :nn}
        ]
      },
      {
        input: :h,
        contracted: [
          {trigger: :n, insertion: :ily},
        ],
        germinated: [
          {trigger: :h, insertion: :ltuh}
        ]
      },
      {
        input: :m,
        contracted: [
          {trigger: :n, insertion: :ily},
        ],
        germinated: [
          {trigger: :m, insertion: :ltum}
        ]
      },
      {
        input: :f,
        output: :y,
        germinated: [
          {trigger: :f, insertion: :ltuf}
        ],
        regression: [
          {trigger: :t, insertion: :f},
          {trigger: :s, insertion: :f},
          {trigger: :n, insertion: :huly},
        ]
      },
      {
        input: :r,
        contracted: [
          {trigger: :h, insertion: :ily},
        ],
        germinated: [
          {trigger: :r, insertion: :ltur}
        ],
      },
      {
        input: :w,
        contracted: [
          {trigger: :h, insertion: :ul},
        ],
        germinated: [
          {trigger: :r, insertion: :ltur}
        ],
      },
      {
        input: :g,
        contracted: [
          {trigger: :n, insertion: :ily},
        ],
        germinated: [
          {trigger: :g, insertion: :ltug},
        ],
      },
      {
        input: :z,
        contracted: [
          {trigger: :h, insertion: :ily},
        ],
        germinated: [
          {trigger: :z, insertion: :ltuz},
        ],
      },
      {
        input: :d,
        contracted: [
          {trigger: :n, insertion: :ely},
          {trigger: :h, insertion: :ily},
        ],
        germinated: [
          {trigger: :d, insertion: :ltud},
        ],
      },
      {
        input: :v,
        output: :p,
        contracted: [
          {trigger: :h, insertion: :ily},
        ],
        regression: [
          {trigger: :t, insertion: :v},
          {trigger: :s, insertion: :v},
        ],
        germinated: [
          {trigger: :v, insertion: :ltuv},
        ],
      },
      {
        input: :b,
        contracted: [
          {trigger: :n, insertion: :ily}
        ],
        germinated: [
          {trigger: :b, insertion: :ltub}
        ]
      },
      {
        input: :l,
        regression: [
          {trigger: :f, insertion: :ly}
        ],
        germinated: [
          {trigger: :l, insertion: :ltul}
        ]
      },
    ],
    symbols: [
      { input: :'[' }, { input: :']' }, { input: :- },
      { input: :"l,", output: :","}, { input: :'l.', output: :"."},
    ]
  }

