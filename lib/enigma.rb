require './lib/modules/encryption'
require './lib/modules/decryption'

class Enigma
  include Encryption
  include Decryption

  attr_reader :character_set
  def initialize
    @character_set = ("a".."z").to_a << " "
    @key = Key.new
    @date = Date.today
  end

  def encrypt(message, key = @key.generate_random_key, date = @date.strftime("%d%m%y"))
    encrypted_message = encrypt_message(message, key, date)
    encryption_hash = {
      encryption: encrypted_message,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = @date.strftime("%d$m%y"))
    decrypted_message = decrypt_message(message, key, date)
    decryption_hash = {
      decryption: decrypted_message,
      key: key,
      date: date
    }
  end

end
