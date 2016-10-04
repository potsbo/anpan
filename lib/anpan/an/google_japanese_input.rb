class Anpan::An
  GOOGLE_JAPANESE = {
    vowels: [
      { input: :a }, { input: :o }, { input: :e }, { input: :u }, { input: :i },
    ],
    consonants: [
      { input: nil },

      {
        input: :k,
        contracted: [
          { trigger: :y, insertion: :ily },
          { trigger: :w, insertion: :ul  },
        ],
        germinated: [
          { insertion: :ltu },
        ],
      },

      {
        input: :s,
        contracted: [
          { trigger: :y, insertion: :ily },
          { trigger: :h, insertion: :ily, vowels: %i(a o e u) },
          { trigger: :h, insertion: nil,  vowels: %i(i) },
        ],
        germinated: [
          { insertion: :ltu }
        ],
      },

      {
        input: :t,
        contracted: [
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
          { insertion: :ltu }
        ],
      },

      {
        input: :c,
        vowel_filter: [],
        germinated: [
          { insertion: :ltu }
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
        vowel_filter: %i(a u o)
      },

      {
        input: :c,
        output: :s,
        vowel_filter: %i(i e)
      },

      {
        input: :n,
        contracted: [
          { trigger: :y,   insertion: :ily },
        ],
        germinated: [
          { insertion: :n },
        ],
        single: %i(nn),
      },

      {
        input: :h,
        contracted: [
          { trigger: :y,  insertion: :ily },
          { trigger: :w,  insertion: :ul,  vowel_filter: %i(a o e i) },
          { trigger: :wy, insertion: :uly, vowel_filter: %i(u) },
        ],
        germinated: [
          { insertion: :ltu }
        ],
      },

      {
        input: :m,
        contracted: [
          { trigger: :y, insertion: :ily },
        ],
        germinated: [
          { insertion: :ltu }
        ],
      },

      {
        input: :y,
        vowel_filter: %i(a u o),
        germinated: [
          { insertion: :ltu }
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
        vowel_filter: %i(a o e i),
        contracted: [
          { trigger: :y, insertion: :y, vowel_filter: %i(a o u)},
        ],
        germinated: [
          { insertion: :ltu }
        ],
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
          { trigger: :y, insertion: :ily },
        ],
        germinated: [
          { insertion: :ltu }
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
          { insertion: :ltu },
        ],
        regression: [
          { trigger: :h, insertion: nil, vowels: %i(u) },
        ],
      },

      {
        input: :g,
        contracted: [
          { trigger: :y, insertion: :ily },
          { trigger: :w, insertion: :ul },
        ],
        germinated: [
          { insertion: :ltu },
        ],
      },

      {
        input: :z,
        contracted: [
          { trigger: :y, insertion: :ily },
        ],
        germinated: [
          { insertion: :ltu },
        ],
      },

      {
        input: :j,
        output: :zily,
        vowel_filter: %i(a o e u),
        contracted: [
          { trigger: :y, insertion: nil },
        ],
        germinated: [
          { insertion: :ltu },
        ],
      },

      {
        input: :j,
        output: :z,
        vowel_filter: %i(i),
        contracted: [
          { trigger: :y, insertion: :ily },
        ],
      },

      {
        input: :d,
        contracted: [
          { trigger: :y,    insertion: :ily },
          { trigger: :w,    insertion: :ol  },
          { trigger: :h,    insertion: :ely },
          { trigger: :"'",  insertion: :el,  vowel_filter: %i(i) },
          { trigger: :"'",  insertion: :ol,  vowel_filter: %i(u) },
          { trigger: :"'y", insertion: :ely, vowel_filter: %i(u) },
        ],
        germinated: [
          { insertion: :ltu },
        ],
      },

      {
        input: :p,
        contracted: [
          { trigger: :y, insertion: :ily },
        ],
        germinated: [
          { insertion: :ltu },
        ],
      },

      {
        input: :v,
        contracted: [
          { trigger: :y, insertion: :uly },
        ],
        germinated: [
          { insertion: :ltu },
        ]
      },
      {
        input: :b,
        contracted: [
          { trigger: :y, insertion: :ily },
        ],
        germinated: [
          { insertion: :ltu },
        ],
      },

      {
        input: %i(l x),
        output: :l,
        contracted: [
          { trigger: :y, insertion: :y },
          { trigger: :k, insertion: :k,  vowel_filter: %i(a e) },
          { trigger: :t, insertion: :t,  vowel_filter: %i(u) },
          { trigger: :ts, insertion: :t, vowel_filter: %i(u) },
          { trigger: :w, insertion: :w,  vowel_filter: %i(a) },
        ],
        germinated: [
          { insertion: :ltu },
        ],
      },

      {
        input: :q,
        output: :kul,
        vowel_filter: %i(a i e o),
        germinated: [
          { insertion: :ltu },
        ],
      },

      {
        input: :q,
        output: :k,
        vowel_filter: %i(u),
      },
    ],

    symbols: [
      { input: :'[' }, { input: :']' }, { input: :- }, { input: :"," }, { input: :"." },
      { input: :~ }, { input: :'z-', output: :~ }, { input: :'z/', output: :'/' },
      { input: :zj, output: :"↓"}, { input: :zk, output: :"↑"}, { input: :zh, output: :"←"}, { input: :zl, output: :"→"},
      { input: :'z[', output: :"z["}, { input: :'z]', output: :"z]"},
      { input: :'z.', output: :"…"}, { input: :'z,', output: :"‥"},
      { input: :xn, output: :nn}, { input: :"n'", output: :nn}, { input: :www, output: :w, addition: :ww, as_is: true}
    ]
  }
end

