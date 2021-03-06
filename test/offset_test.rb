require './test/test_helper'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_it_initializes_an_empty_hash
    offset = Offset.new

    assert_equal ({}), offset.offset_hash
  end

  def test_it_can_generate_an_offset_using_todays_date
    offset = Offset.new

    actual = offset.generate_offset

    expected = Date.today.strftime("%d%m%y")

    assert_instance_of String, actual
    assert_equal expected, actual
  end

  def test_it_can_generate_an_offset_hash_given_a_date
    offset = Offset.new

    actual = offset.generate_offset_hash("040895")

    expected = {
      a: 1,
      b: 0,
      c: 2,
      d: 5
    }

    assert_equal expected, actual
  end

  def test_it_can_generate_an_offset_hash_using_todays_date
    offset = Offset.new

    expected = offset.generate_offset_hash

    assert_equal expected, offset.offset_hash
  end
end
