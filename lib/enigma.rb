require './lib/modules/runner_helper'

class Enigma
  include Encryption
  include Decryption

  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
    @key = Key.new
    @date = Offset.new
  end

  def encrypt(message, key = @key.generate_random_key, date = @date.generate_offset)
    encrypted_message = encrypt_message(message, key, date)
    encryption_hash = {
      encryption: encrypted_message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = date = @date.generate_offset)
    decrypted_message = decrypt_message(message, key, date)
    decryption_hash = {
      decryption: decrypted_message,
      key: key,
      date: date
    }
  end

end
