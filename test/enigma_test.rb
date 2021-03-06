require './test/test_helper'

class EnigmaTest < Minitest::Test
  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_has_the_desired_character_set
    enigma = Enigma.new

    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, enigma.character_set
  end

  # Enigma#encrypt method tests

  def test_it_can_encrypt_messages_with_key_and_date_given
    enigma = Enigma.new

    actual = enigma.encrypt("hello world", "02715", "040895")

    expected = {
      encryption: "keder ohulw",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, actual
  end

  # Test built on 01/06/19
  def test_it_can_encrypt_messages_with_key_without_date
    enigma = Enigma.new
    date = Offset.new

    actual = enigma.encrypt("hello world", "02715")

    expected = {
      encryption: "nfhauasdxm ",
      key: "02715",
      date: date.generate_offset
    }

    assert_equal expected, actual
  end

  def test_it_can_encrypt_messages_without_key_or_date
    enigma = Enigma.new
    key = Key.new
    date = Offset.new
    date = date.generate_offset

    actual = enigma.encrypt("hello world")

    assert_equal 11, actual[:encryption].length
    assert_equal 5, actual[:key].length
    assert_equal date, actual[:date]
  end

  # Enigma#decrypt method tests

  def test_it_can_decrypt_messages_with_key_and_date_given
    enigma = Enigma.new

    actual = enigma.decrypt("keder ohulw", "02715", "040895")

    expected = {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }

    assert_equal expected, actual
  end

  # Test built on 01/06/19
  def test_it_can_decrypt_messages_with_key_without_date
    enigma = Enigma.new

    actual = enigma.decrypt("keder ohulw", "02715")

    expected = {
      decryption: "edhplzssok ",
      key: "02715",
      date: "070119"
    }

    assert_equal expected, actual
  end

end
