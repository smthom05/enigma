require './test/test_helper'

class OffsetTest < Minitest::Test
  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_it_can_generate_an_offset_using_todays_date
    offset = Offset.new

    actual = offset.generate_offset

    expected = Date.today.strftime("%d%m%y")

    assert_instance_of Offset, actual
    assert_equal expected, actual
  end
end
