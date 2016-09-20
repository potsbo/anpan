class Anpan
  GOOGLE_JAPANESE = {
      vowels: [
          {input: :a}, {input: :o}, {input: :e}, {input: :u}, {input: :i},
      ],
      consonants: [
          { input: nil },

          {
              input: :c,
              vowel_filter: [],
              germinated: [
                  { trigger: :c, insertion: :ltuc }
              ],
              regression: [
                  { trigger: :h, insertion: :tily, vowels: %i(a o e u)},
                  { trigger: :h, insertion: :t, vowels: %i(i)},
                  { trigger: :y, insertion: :tily, vowels: %i(a o e u)},
                  { trigger: :y, insertion: :til, vowels: %i(i)}
              ]
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
              input: :k,
              contracted: [
                  { trigger: :y, insertion: :ily },
                  { trigger: :w, insertion: :ul },
              ],
              germinated: [
                  { trigger: :k, insertion: :ltuk }
              ]
          },

          {
              input: :s,
              contracted: [
                  { trigger: :y, insertion: :ily },
                  { trigger: :h, insertion: :ily, vowels: %i(a o e u) },
                  { trigger: :h, insertion: nil, vowels: %i(i) },
              ],
              germinated: [
                  { trigger: :s, insertion: :ltus }
              ]
          },

          {
              input: :t,
              contracted: [
                  { trigger: :y, insertion: :ily },
                  { trigger: :h, insertion: :ely },
                  { trigger: :s, insertion: :ul, vowel_filter: %i(a o e i) },
                  { trigger: :s, insertion: nil, vowel_filter: %i(u) },
                  { trigger: :w, insertion: :ol },
                  { trigger: :"'", insertion: :el, vowel_filter: %i(i) },
                  { trigger: :"'y", insertion: :ely, vowel_filter: %i(u) },
                  { trigger: :"'", insertion: :ol, vowel_filter: %i(u) },
              ],
              germinated: [
                  { trigger: :t, insertion: :ltut }
              ]
          },
          {
              input: :n ,
              contracted: [
                  { trigger: :y, insertion: :ily },
              ],
              germinated: [
                  { trigger: :n, insertion: :nn },
                  { trigger: :"'", insertion: :nn }
              ],
              single: %i(nn)
          },
          {
              input: :h,
              contracted: [
                  { trigger: :y, insertion: :ily },
                  { trigger: :w, insertion: :ul, vowel_filter: %i(a o e i) },
                  { trigger: :wy, insertion: :uly, vowel_filter: %i(u) },
              ],
              germinated: [
                  { trigger: :h, insertion: :ltuh }
              ]
          },
          {
              input: :m,
              contracted: [
                  { trigger: :y, insertion: :ily },
              ],
              germinated: [
                  { trigger: :m, insertion: :ltum }
              ]
          },
          {
              input: :y,
              vowel_filter: %i(a u o),
              germinated: [
                  { trigger: :y, insertion: :ltuy }
              ]
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
                  { trigger: :f, insertion: :ltuf }
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
                  { trigger: :y, insertion: :ily },
              ],
              germinated: [
                  { trigger: :r, insertion: :ltur }
              ]
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
              ]
          },
          {
              input: :w,
              vowel_filter: %i(a u o),
              contracted: [
                  { trigger: :h, insertion: :ul, vowel_filter: %i(a o)},
              ],
              germinated: [
                  { trigger: :w, insertion: :ltuw }
              ],
              regression: [
                  { trigger: :h, insertion: nil, vowels: %i(u) }
              ]
          },

          {
              input: :g,
              contracted: [
                  { trigger: :y, insertion: :ily },
                  { trigger: :w, insertion: :ul },
              ],
              germinated: [
                  { trigger: :g, insertion: :ltug }
              ]
          },
          {
              input: :z,
              contracted: [
                  { trigger: :y, insertion: :ily },
              ],
              germinated: [
                  { trigger: :z, insertion: :ltuz }
              ]
          },
          {
              input: :j,
              output: :zily,
              vowel_filter: %i(a o e u),
              contracted: [
                  { trigger: :y, insertion: nil },
              ],
              germinated: [
                  { trigger: :j, insertion: :ltuj }
              ]
          },

          {
              input: :j,
              output: :z,
              vowel_filter: %i(i),
              contracted: [
                  { trigger: :y, insertion: :ily },
              ]
          },

          {
              input: :d,
              contracted: [
                  { trigger: :y, insertion: :ily },
                  { trigger: :w, insertion: :ol },
                  { trigger: :h, insertion: :ely },
                  { trigger: :"'", insertion: :el, vowel_filter: %i(i) },
                  { trigger: :"'", insertion: :ol, vowel_filter: %i(u) },
                  { trigger: :"'y", insertion: :ely, vowel_filter: %i(u) },
              ],
              germinated: [
                  { trigger: :d, insertion: :ltud }
              ]
          },
          {
              input: :p,
              contracted: [
                  { trigger: :y, insertion: :ily },
              ],
              germinated: [
                  { trigger: :p, insertion: :ltup }
              ]
          },
          {
              input: :v,
              contracted: [
                  { trigger: :y, insertion: :uly },
              ],
              germinated: [
                  { trigger: :v, insertion: :ltuv }
              ]
          },
          {
              input: :b,
              contracted: [
                  { trigger: :y, insertion: :ily },
              ],
              germinated: [
                  { trigger: :b, insertion: :ltub }
              ]
          },

          {
              input: :l,
              contracted: [
                  { trigger: :y, insertion: :y },
                  { trigger: :k, insertion: :k, vowel_filter: %i(a e) },
                  { trigger: :t, insertion: :t, vowel_filter: %i(u) },
                  { trigger: :ts, insertion: :t, vowel_filter: %i(u) },
                  { trigger: :w, insertion: :w, vowel_filter: %i(a) },
              ],
              germinated: [
                  { trigger: :l, insertion: :ltul }
              ]
          },

          {
              input: :x,
              output: :l,
              contracted: [
                  { trigger: :y, insertion: :y },
                  { trigger: :k, insertion: :k, vowel_filter: %i(a e) },
                  { trigger: :t, insertion: :t, vowel_filter: %i(u) },
                  { trigger: :ts, insertion: :t, vowel_filter: %i(u) },
                  { trigger: :w, insertion: :w, vowel_filter: %i(a) },
              ],
              germinated: [
                  { trigger: :x, insertion: :ltux }
              ]
          },
          {
              input: :q,
              output: :kul,
              vowel_filter: %i(a i e o),
              germinated: [
                  { trigger: :q, insertion: :ltuq }
              ]
          },

          {
              input: :q,
              output: :k,
              vowel_filter: %i(u),
          },

      ],
      symbols: [
          { input: :'[' }, { input: :']' }, { input: :- }, { input: :","}, { input: :"."},
          { input: :~ }, { input: :'z-', output: :~ }, { input: :'z/', output: :'/' },
          { input: :zj, output: :"↓"}, { input: :zk, output: :"↑"}, { input: :zh, output: :"←"}, { input: :zl, output: :"→"},
          { input: :'z[', output: :"z["}, { input: :'z]', output: :"z]"}, { input: :'z.', output: :"…"}, { input: :'z,', output: :"‥"},
          { input: :xn, output: :nn}, { input: :www, output: :w, addition: :ww, as_is: true}
      ]
  }
end
