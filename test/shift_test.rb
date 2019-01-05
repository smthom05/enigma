require './test/test_helper'

class ShiftTest < Minitest::Test
  def test_it_exists
    shift = Shift.new

    assert_instance_of Shift, shift
  end

  def test_it_starts_with_empty_shift_hash
    shift = Shift.new

    assert_equal ({}), shift.shift_hash
  end

  def test_it_can_generate_shift_hash
    shift = Shift.new
    key = Key.new
    offset = Offset.new

    key_hash = key.generate_key_hash("02715")
    offset_hash = offset.generate_offset_hash("040895")


    shift.generate_shift_hash(key_hash, offset_hash)

    expected = {
      a: 3,
      b: 27,
      c: 73,
      d: 20
    }

    assert_equal expected, shift.shift_hash
  end
end
