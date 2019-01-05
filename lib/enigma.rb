require "date"

class Enigma
  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def encrypt(message, key = "", date = Date.today)
    encryption_hash = {}
  end

  def decrypt(message, key, date = Date.today)
    decryption_hash = {}
  end

end
