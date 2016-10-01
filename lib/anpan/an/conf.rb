class Anpan::An
  CONF = {
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
          {trigger: :c, insertion: :ltu}
        ]
      },
      {
        input: :s,
        contracted: [
          {trigger: :h, insertion: :ily}
        ],
        germinated: [
          {trigger: :s, insertion: :ltu}
        ]
      },
      {
        input: :t,
        contracted: [
          {trigger: :n, insertion: :ily},
          {trigger: :h, insertion: :ely},
        ],
        germinated: [
          {trigger: :t, insertion: :ltu}
        ],
      },
      {
        input: :n,
        contracted: [
          {trigger: :h, insertion: :ily},
        ],
        germinated: [
          {trigger: :n, insertion: :n}
        ],
      },
      {
        input: :h,
        contracted: [
          {trigger: :n, insertion: :ily},
        ],
        germinated: [
          {trigger: :h, insertion: :ltu}
        ]
      },
      {
        input: :m,
        contracted: [
          {trigger: :n, insertion: :ily},
        ],
        germinated: [
          {trigger: :m, insertion: :ltu}
        ]
      },
      {
        input: :f,
        output: :y,
        germinated: [
          {trigger: :f, insertion: :ltu}
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
          {trigger: :r, insertion: :ltu}
        ],
      },
      {
        input: :w,
        contracted: [
          {trigger: :h, insertion: :ul},
        ],
        germinated: [
          {trigger: :r, insertion: :ltu}
        ],
      },
      {
        input: :g,
        contracted: [
          {trigger: :n, insertion: :ily},
        ],
        germinated: [
          {trigger: :g, insertion: :ltu},
        ],
      },
      {
        input: :z,
        contracted: [
          {trigger: :h, insertion: :ily},
        ],
        germinated: [
          {trigger: :z, insertion: :ltu},
        ],
      },
      {
        input: :d,
        contracted: [
          {trigger: :n, insertion: :ely},
          {trigger: :h, insertion: :ily},
        ],
        germinated: [
          {trigger: :d, insertion: :ltu},
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
          {trigger: :v, insertion: :ltu},
        ],
      },
      {
        input: :b,
        contracted: [
          {trigger: :n, insertion: :ily}
        ],
        germinated: [
          {trigger: :b, insertion: :ltu}
        ]
      },
      {
        input: :l,
        regression: [
          {trigger: :f, insertion: :ly}
        ],
        germinated: [
          {trigger: :l, insertion: :ltu}
        ]
      },
    ],
    symbols: [
      { input: :'[' }, { input: :']' }, { input: :- },
      { input: :"l,", output: :","}, { input: :'l.', output: :"."},
    ]
  }
end
