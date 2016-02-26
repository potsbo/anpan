require 'test/unit'
require 'consonant'

class ConsonantTest < Test::Unit::TestCase
  def test_simple_read
    assert_equal Consonant.new('c',{"output"=>'k'}).input, 'c'
  end

  def test_simple_50_sounds
    a = Vowel.new('a','a')
    c = Consonant.new('c',{"output"=>'k'})
    c.addVowel(a)
    assert c.patterns.is_a? Array
  end
end

