class Anpan
  class An
    DVORAKJP = {
      :vowels => [
        { input: :a }, { input: :o }, { input: :e }, { input: :u }, { input: :i },
        { input: :"'", output: :ai},  { input: :',', output: :ou }, { input: :'.', output: :ei },
        { input: :p, output: :uu},
        { input: :";", output: :ann }, { input: :q, output: :onn }, { input: :j, output: :enn },
        { input: :k, output: :unn },   { input: :x, output: :inn },
      ],
      consonants: [
        {
          input: nil,
          only_singles: true,
        },

        {
          input: :k,
          avoid_self: true,
          contracted: [
            { trigger: :y, insertion: :ily, avoid_self: false },
            { trigger: :h, insertion: :ily, avoid_self: false },
            { trigger: :w, insertion: :ul,  avoid_self: false },
          ],
          germinated: [
            { insertion: :ltu },
          ]
        },

        {
          input: :s,
          contracted: [
            { trigger: :h, insertion: :ily, vowels: %i(a o e u) },
            { trigger: :h, insertion: nil,  vowels: %i(i) },
            { trigger: :y, insertion: :ily, vowels: %i(a o e u i) },
          ],
          germinated: [
            { insertion: :ltu }
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
            { trigger: :h, insertion: :tily, vowels: %i(a o e u) },
            { trigger: :h, insertion: :t,    vowels: %i(i) },
            { trigger: :n, insertion: :kily, vowels: %i(a o e u i) },
            { trigger: :y, insertion: :tily, vowels: %i(a o e u) },
            { trigger: :y, insertion: :til,  vowels: %i(i) },
            { trigger: :w, insertion: :kul,  vowels: %i(a o e u i) },
          ],
        },

        {
          input: :c,
          output: :k,
        },

        {
          input: :n,
          contracted: [
            { trigger: :h, insertion: :ily },
            { trigger: :y, insertion: :ily },
          ],
          germinated: [
            { insertion: :n },
          ],
          single: %i(nn),
        },

        {
          input: :h,
          contracted: [
            { trigger: :n, insertion: :ily },
            { trigger: :y, insertion: :ily },
            { trigger: :w, insertion: :ul,  vowel_filter: %i(a o e i), only_singles: true },
          ],
          germinated: [
            { insertion: :ltu },
          ]
        },

        {
          input: :m,
          contracted: [
            { trigger: :n, insertion: :ily },
            { trigger: :y, insertion: :ily },
          ],
          germinated: [
            { insertion: :ltu },
          ]
        },

        {
          input: :y,
          vowel_filter: %i(a u o),
          germinated: [
            { insertion: :ltu },
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
            { trigger: :y, insertion: :y, vowel_filter: %i(a u o) },
            { trigger: :n, insertion: :y, vowel_filter: %i(a o) },
          ],
          germinated: [
            { insertion: :ltu },
          ],
        },

        {
          input: :f,
          output: :h,
          vowel_filter: %i(u),
          contracted: [
            { trigger: :y, insertion: :uly },
            { trigger: :n, insertion: :uly },
          ],
        },

        {
          input: :r,
          contracted: [
            { trigger: :h, insertion: :ily },
            { trigger: :y, insertion: :ily },
          ],
          germinated: [
            { insertion: :ltu },
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
            { trigger: :y, insertion: :w, only_singles: true }
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
            { trigger: :n, insertion: :ily },
            { trigger: :y, insertion: :ily },
            { trigger: :w, insertion: :ul  },
          ],
          germinated: [
            { insertion: :ltu },
          ],
        },

        {
          input: :z,
          contracted: [
            { trigger: :h, insertion: :ily },
            { trigger: :y, insertion: :ily },
          ],
          germinated: [
            { insertion: :ltu},
          ],
        },

        {
          input: :j,
          output: :zily,
          avoid_self: true,
          vowel_filter: %i(a o e u),
          contracted: [
            { trigger: :y, insertion: nil, avoid_self: false },
            { trigger: :h, insertion: nil, avoid_self: false },
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
          regression: [
            { trigger: :h,  insertion: :zil, vowel_filter: %i(i) },
          ],
        },

        {
          input: :d,
          contracted: [
            { trigger: :n, insertion: :ily},
            { trigger: :y,    insertion: :ily },
            { trigger: :w,    insertion: :ol  },
            { trigger: :h,    insertion: :ely },
          ],
          germinated: [
            { insertion: :ltu },
          ],
        },

        {
          input: :v,
          contracted: [
            { trigger: :y, insertion: :uly },
            { trigger: :h, insertion: :uly },
          ],
          germinated: [
            { insertion: :ltu },
          ]
        },

        {
          input: :b,
          contracted: [
            {trigger: :n, insertion: :ily},
            {trigger: :y, insertion: :ily},
          ],
          germinated: [
            { insertion: :ltu },
          ]
        },

        {
          input: :p,
          avoid_self: true,
          contracted: [
            { trigger: :h, insertion: :ily, avoid_self: false },
            { trigger: :y, insertion: :ily, avoid_self: false },
          ],
          germinated: [
            { insertion: :ltu },
          ]
        },

        {
          input: :l,
          contracted: [
            { trigger: :y,  insertion: :y },
            { trigger: :h,  insertion: :y },
            { trigger: :k,  insertion: :k, vowel_filter: %i(a e), only_singles: true },
            { trigger: :c,  insertion: :k, vowel_filter: %i(a e), only_singles: true },
            { trigger: :t,  insertion: :t, vowel_filter: %i(u),   only_singles: true },
            { trigger: :ts, insertion: :t, vowel_filter: %i(u),   only_singles: true },
            { trigger: :w,  insertion: :w, vowel_filter: %i(a),   only_singles: true },
          ],
          germinated: [
            { insertion: :ltu },
          ]
        },

        {
          input: :x,
          avoid_self: true,
          output: :l,
          contracted: [
            { trigger: :y,  insertion: :y,                                               avoid_self: false },
            { trigger: :k,  insertion: :k, vowel_filter: %i(a e),   only_singles: true,  avoid_self: false },
            { trigger: :c,  insertion: :k, vowel_filter: %i(a e),   only_singles: true,  avoid_self: false },
            { trigger: :t,  insertion: :t, vowel_filter: %i(u),     only_singles: true,  avoid_self: false },
            { trigger: :ts, insertion: :t, vowel_filter: %i(u),     only_singles: true,  avoid_self: false },
            { trigger: :w,  insertion: :w, vowel_filter: %i(a),     only_singles: true,  avoid_self: false },
            { trigger: :h,  insertion: :y, vowel_filter: %i(a u o),                      avoid_self: false },
            { trigger: :h,  insertion: :y, vowel_filter: %i(i e),                        avoid_self: false },
          ],
          germinated: [
            { insertion: :ltu },
          ],
        },

        {
          input: :q,
          avoid_self: true,
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
        { input: :'[' }, { input: :']' }, { input: :- },
        { input: :~ }, { input: :';-', output: :~ }, { input: :';/', output: :'/' },
        { input: :",", output: :","}, { input: :'.', output: :"."},
        { input: :';j', output: :"↓"}, { input: :';k', output: :"↑"}, { input: :';h', output: :"←"}, { input: :';l', output: :"→"},
        { input: :';[', output: :"z["}, { input: :';]', output: :"z]"},
        { input: :';.', output: :"…"}, { input: :';,', output: :"‥"},
        { input: :xn, output: :nn}, { input: :www, output: :w, addition: :ww, as_is: true}
      ]
    }
  end
end
