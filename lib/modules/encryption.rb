module Encryption

  def encrypt_message(message, key, date)
    encrypted_word = ""
    shift_hash = gather_hashes(key,date)

  end

  def gather_hashes(key, date)
    key = Key.new.generate_key_hash(key)
    offset = Offset.new.generate_offset_hash(date)
    shift = Shift.new.generate_shift_hash(key, offset)
  end

end
