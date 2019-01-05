require './test/test_helper'

class KeyTest < Minitest::Test
  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_can_generate_a_random_key
    key = Key.new

    actual = key.generate_random_key
    range = ("00001".."99999")

    assert_instance_of String, actual
    assert_equal 5, actual.length
    assert_equal true, range.member?(actual)
  end
end
