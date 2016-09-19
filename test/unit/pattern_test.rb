require 'test/unit'
require 'pattern'

class PatternTest < Test::Unit::TestCase
  def test_make_jp
    assert_not_nil TABLE
    assert_not_nil TABLE[:a]
    assert_not_nil TABLE['a'.to_sym]
    assert Pattern.new('a','a').output_jp.is_a? String
    assert_equal 'あ', Pattern.new('a','a').output_jp
  end
end

