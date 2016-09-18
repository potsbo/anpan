require 'test/unit'
require 'anpan'
require 'conf'

class AnpanTest < Test::Unit::TestCase
  def test_load_one_vowel
    anpan = Anpan.new
    anpan.load_vowel("a" => "a")
    assert_equal  1,  anpan.vowel_list.size
    assert_equal 'a', anpan.vowel_list.first.output
  end

  def test_anpan
    anpan = Anpan.new
    anpan.load_conf(CONF)
    res = anpan.render

    expected = [
      "a\tあ", "i\tい", "u\tう", "e\tえ", "o\tお",
      "ca\tか","ci\tき","cu\tく","ce\tけ","co\tこ",
      "ta\tた","ti\tち","tu\tつ","te\tて","to\tと",
      "na\tな","ni\tに","nu\tぬ","ne\tね","no\tの",
      "ha\tは","hi\tひ","hu\tふ","he\tへ","ho\tほ",
      "ma\tま","mi\tみ","mu\tむ","me\tめ","mo\tも",
      "fa\tや","fi\tい","fu\tゆ","fe\tえ","fo\tよ",
      "ra\tら","ri\tり","ru\tる","re\tれ","ro\tろ",
      "cna\tきゃ","cni\tきぃ","cnu\tきゅ","cne\tきぇ","cno\tきょ",
      "cn;\tきゃん","cnq\tきょん","cnj\tきぇん","cnk\tきゅん","cnx\tきぃん",
      "cc\tっ\tc",
      "wha\tうぁ","whi\tうぃ","whu\tうぅ","whe\tうぇ","who\tうぉ",
    ]
    expected.each do |e|
      assert res.include?(e+"\n"), res + "#{e} was not found\n"
    end

    anpan.patterns.each do |p|
      # assert_not_nil p.output_jp, "input: '#{p.input}'\n" + res
      assert_nil p.output_jp.match(/[a-z]+/), res + "output: #{p.output_jp}\n"
    end
  end
end
