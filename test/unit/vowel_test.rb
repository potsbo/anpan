require 'test/unit'
require 'vowel'

class VowelTest < Test::Unit::TestCase
  def test_simple_read
    # nomal vowels
    assert_equal Vowel.new('a','a').input, 'a'
    assert_equal Vowel.new('o','o').input, 'o'
    assert_equal Vowel.new('e','e').input, 'e'
    assert_equal Vowel.new('u','u').input, 'u'
    assert_equal Vowel.new('i','i').input, 'i'

    assert_equal Vowel.new('a','a').output, 'a'
    assert_equal Vowel.new('o','o').output, 'o'
    assert_equal Vowel.new('e','e').output, 'e'
    assert_equal Vowel.new('u','u').output, 'u'
    assert_equal Vowel.new('i','i').output, 'i'

    # special vowels
    assert_equal Vowel.new(';','ann').output, 'ann'
    assert_equal Vowel.new('q','onn').output, 'onn'
    assert_equal Vowel.new('j','enn').output, 'enn'
    assert_equal Vowel.new('k','unn').output, 'unn'
    assert_equal Vowel.new('x','inn').output, 'inn'
  end
end
