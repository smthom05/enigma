require './test/test_helper'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_can_encrypt_messages
    enigma = Enigma.new

    actual = enigma.encrypt("hello world")

    assert_equal nil, actual
  end

  def test_it_can_decrypt_messages
    enigma = Enigma.new

    actual = enigma.decrypt("hello world", 02715)

    assert_equal nil, actual
  end

end
