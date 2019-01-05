require './test/test_helper'

class KeyTest < Minitest::Test
  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_starts_with_an_empty_key_hash
    key = Key.new

    assert_equal ({}), key.key_hash
  end

  def test_it_can_generate_a_random_key
    key = Key.new

    actual = key.generate_random_key
    range = ("00001".."99999")

    assert_instance_of String, actual
    assert_equal 5, actual.length
    assert_equal true, range.member?(actual)
  end

  def test_it_can_generate_key_hash_given_a_key
    key = Key.new

    actual = key.generate_key_hash("02715")

    expected = {
      a: 2,
      b: 27,
      c: 71,
      d: 15
    }

    assert_equal expected, actual
  end
end
