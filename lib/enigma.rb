require './lib/modules/encryption'

class Enigma
  include Encryption

  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
    @key = Key.new
    @date = Date.today
  end

  def encrypt(message, key = @key.generate_random_key, date = @date.strftime("%d%m%y"))
    encrypt_message(message, key, date)
    encryption_hash = {}
  end

  def decrypt(message, key, date = Date.today)
    decryption_hash = {}
  end

end
