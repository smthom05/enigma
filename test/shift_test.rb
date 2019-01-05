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
  # def test_it_can_generate_shift_hash
  #   shift = Shift.new
  #
  #   assert
  # end
end
