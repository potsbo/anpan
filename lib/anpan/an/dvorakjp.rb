class Anpan::An
  DVORAKJP = {
    :vowels => [
      {input: :a}, {input: :o}, {input: :e}, {input: :u}, {input: :i},
      {input: :"'", output: :ai}, {input: :',', output: :ou}, {input: :'.', output: :ei},
      {input: :p, output: :uu},
      {input: :";", output: :ann}, {input: :q, output: :onn}, {input: :j, output: :enn},
      {input: :k, output: :unn}, {input: :x, output: :inn},
    ],
    consonants: [
      { input: nil },

      {
        input: :k,
        contracted: [
          { trigger: :y, insertion: :ily },
          { trigger: :h, insertion: :ily },
          { trigger: :w, insertion: :ul  },
        ],
        germinated: [
          { trigger: :k, insertion: :ltuk },
        ]
      },

      {
        input: :cn,
        output: :kily,
      },

      {
        input: :cy,
        output: :kily,
      },

      {
        input: :cy,
        output: :tily,
      },

      {
        input: :cw,
        output: :kul,
      },

      {
        input: :s,
        contracted: [
          { trigger: :h, insertion: :ily, vowels: %i(a o e u) },
          { trigger: :h, insertion: nil,  vowels: %i(i) },
          { trigger: :y, insertion: :ily, vowels: %i(a o e u) },
          { trigger: :y, insertion: nil,  vowels: %i(i) },
        ],
        germinated: [
          {trigger: :s, insertion: :ltus}
        ]
      },

      {
        input: :t,
        contracted: [
          { trigger: :n,    insertion: :ily },
          { trigger: :y,    insertion: :ily },
          { trigger: :h,    insertion: :ely },
          { trigger: :s,    insertion: :ul,  vowel_filter: %i(a o e i) },
          { trigger: :s,    insertion: nil,  vowel_filter: %i(u) },
          { trigger: :w,    insertion: :ol },
          { trigger: :"'",  insertion: :el,  vowel_filter: %i(i) },
          { trigger: :"'y", insertion: :ely, vowel_filter: %i(u) },
          { trigger: :"'",  insertion: :ol,  vowel_filter: %i(u) },
        ],
        germinated: [
          { trigger: :t,    insertion: :ltut }
        ],
      },

      {
        input: :c,
        vowel_filter: [],
        germinated: [
          { trigger: :c, insertion: :ltuc }
        ],
        regression: [
          { trigger: :h, insertion: :tily, vowels: %i(a o e u)},
          { trigger: :h, insertion: :t,    vowels: %i(i)},
          { trigger: :y, insertion: :tily, vowels: %i(a o e u)},
          { trigger: :y, insertion: :til,  vowels: %i(i)}
        ],
      },

      {
        input: :c,
        output: :k,
      },

      {
        input: :n,
        contracted: [
          {trigger: :h, insertion: :ily},
          {trigger: :y, insertion: :ily},
        ],
        germinated: [
          {trigger: :n, insertion: :nn}
        ]
      },

      {
        input: :h,
        contracted: [
          { trigger: :n, insertion: :ily },
          { trigger: :y, insertion: :ily },
          { trigger: :w, insertion: :ul,  vowel_filter: %i(a o e i) },
        ],
        germinated: [
          { trigger: :h, insertion: :ltuh }
        ]
      },

      {
        input: :m,
        contracted: [
          {trigger: :n, insertion: :ily},
          {trigger: :y, insertion: :ily},
        ],
        germinated: [
          {trigger: :m, insertion: :ltum}
        ]
      },

      {
        input: :y,
        vowel_filter: %i(a u o),
        germinated: [
          { trigger: :y, insertion: :ltuy }
        ],
      },

      {
        input: :y,
        output: :il,
        vowel_filter: %i(e),
      },

      {
        input: :f,
        output: :hul,
        contracted: [
          { trigger: :y, insertion: :y }
        ],
        germinated: [
          {trigger: :f, insertion: :ltuf}
        ],
        regression: [
          {trigger: :n, insertion: :huly},
        ]
      },

      {
        input: :f,
        output: :h,
        vowel_filter: %i(u),
        contracted: [
          { trigger: :y, insertion: :uly},
        ],
      },

      {
        input: :r,
        contracted: [
          {trigger: :h, insertion: :ily},
          {trigger: :y, insertion: :ily},
        ],
        germinated: [
          {trigger: :r, insertion: :ltur}
        ],
      },

      {
        input: :w,
        output: :ul,
        vowel_filter: %i(i e),
        contracted: [
          { trigger: :h}
        ],
        regression: [
          { trigger: :y, insertion: :w}
        ],
      },

      {
        input: :w,
        vowel_filter: %i(a u o),
        contracted: [
          { trigger: :h, insertion: :ul, vowel_filter: %i(a o)},
        ],
        germinated: [
          { trigger: :w, insertion: :ltuw },
        ],
        regression: [
          { trigger: :h, insertion: nil, vowels: %i(u) },
        ],
      },

      {
        input: :g,
        contracted: [
          { trigger: :n, insertion: :ily },
          { trigger: :y, insertion: :ily },
          { trigger: :w, insertion: :ul  },
        ],
        germinated: [
          { trigger: :g, insertion: :ltug },
        ],
      },

      {
        input: :z,
        contracted: [
          { trigger: :h, insertion: :ily },
          { trigger: :y, insertion: :ily },
        ],
        germinated: [
          {trigger: :z, insertion: :ltuz},
        ],
      },

      {
        input: :j,
        output: :zily,
        vowel_filter: %i(a o e u),
        contracted: [
          { trigger: :y, insertion: nil },
          { trigger: :h, insertion: nil },
        ],
        germinated: [
          { trigger: :j, insertion: :ltuj },
        ],
      },

      {
        input: :j,
        output: :z,
        vowel_filter: %i(i),
        contracted: [
          { trigger: :y, insertion: :ily },
          { trigger: :h, insertion: nil },
        ],
      },

      {
        input: :d,
        contracted: [
          { trigger: :n, insertion: :ily},
          { trigger: :y,    insertion: :ily },
          { trigger: :w,    insertion: :ol  },
          { trigger: :h,    insertion: :ely },
          { trigger: :"'",  insertion: :el,  vowel_filter: %i(i) },
          { trigger: :"'",  insertion: :ol,  vowel_filter: %i(u) },
          { trigger: :"'y", insertion: :ely, vowel_filter: %i(u) },
        ],
        germinated: [
          {trigger: :d, insertion: :ltud},
        ],
      },

      {
        input: :v,
        contracted: [
          { trigger: :y, insertion: :uly },
          { trigger: :h, insertion: :uly },
        ],
        germinated: [
          { trigger: :v, insertion: :ltuv },
        ]
      },

      {
        input: :b,
        contracted: [
          {trigger: :n, insertion: :ily},
          {trigger: :y, insertion: :ily},
        ],
        germinated: [
          {trigger: :b, insertion: :ltub}
        ]
      },

      {
        input: :p,
        contracted: [
          {trigger: :n, insertion: :ily},
          {trigger: :h, insertion: :ily},
          {trigger: :y, insertion: :ily},
        ],
        germinated: [
          {trigger: :p, insertion: :ltup},
        ]
      },

      {
        input: :l,
        contracted: [
          { trigger: :y,  insertion: :y },
          { trigger: :h,  insertion: :y },
          { trigger: :k,  insertion: :k, vowel_filter: %i(a e) },
          { trigger: :c,  insertion: :k, vowel_filter: %i(a e) },
          { trigger: :t,  insertion: :t, vowel_filter: %i(u) },
          { trigger: :ts, insertion: :t, vowel_filter: %i(u) },
        ],
        germinated: [
          {trigger: :l, insertion: :ltul},
        ]
      },

      {
        input: :x,
        output: :l,
        contracted: [
          { trigger: :y,  insertion: :y },
          { trigger: :k,  insertion: :k, vowel_filter: %i(a e) },
          { trigger: :c,  insertion: :k, vowel_filter: %i(a e) },
          { trigger: :t,  insertion: :t, vowel_filter: %i(u) },
          { trigger: :ts, insertion: :t, vowel_filter: %i(u) },
          { trigger: :w,  insertion: :w, vowel_filter: %i(a) },
          { trigger: :h,  insertion: :y, vowel_filter: %i(a u o) },
          { trigger: :h,  insertion: :y, vowel_filter: %i(i e) },
        ],
        germinated: [
          { trigger: :x, insertion: :ltux },
        ],
      },

      {
        input: :q,
        output: :kul,
        vowel_filter: %i(a i e o),
        germinated: [
          { trigger: :q, insertion: :ltuq },
        ],
      },

      {
        input: :q,
        output: :k,
        vowel_filter: %i(u),
      },
    ],

    symbols: [
      { input: :'[' }, { input: :']' }, { input: :- },
      { input: :~ }, { input: :';-', output: :~ }, { input: :';/', output: :'/' },
      { input: :",", output: :","}, { input: :'.', output: :"."},
      { input: :';j', output: :"↓"}, { input: :';k', output: :"↑"}, { input: :';h', output: :"←"}, { input: :';l', output: :"→"},
      { input: :';[', output: :";["}, { input: :';]', output: :";]"},
      { input: :xn, output: :nn}, { input: :www, output: :w, addition: :ww, as_is: true}
    ]
  }
end
