module Encryption

  def encrypt_message(message, key, date)
    new_character_sets_hash = gather_encryption_hashes(key,date)
    encrypted_message = ""

    i = 0
    message.each_char do |char|
      index = character_set.index(char)
      if i == 0
        encrypted_message += new_character_sets_hash[:a].values_at(index).pop
        i += 1
      elsif i == 1
        encrypted_message += new_character_sets_hash[:b].values_at(index).pop
        i += 1
      elsif i == 2
        encrypted_message += new_character_sets_hash[:c].values_at(index).pop
        i += 1
      elsif i == 3
        encrypted_message += new_character_sets_hash[:d].values_at(index).pop
        i = 0
      end
    end
    encrypted_message
  end

  def gather_encryption_hashes(key, date)
    key = Key.new.generate_key_hash(key)
    offset = Offset.new.generate_offset_hash(date)
    shift = Shift.new.generate_shift_hash(key, offset)
    new_character_sets_hash = generate_new_encryption_character_sets(shift)
  end

  def generate_new_encryption_character_sets(shift)
    character_sets_hash = {}
    shift.each do |k,v|
      character_sets_hash[k] = character_set.rotate(v)
    end
    character_sets_hash
  end

end
