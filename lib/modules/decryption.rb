module Decryption

  def decrypt_message(message, key, date)
    new_character_sets_hash = gather_decryption_hashes(key,date)
    decrypted_message = ""

    i = 0
    message.each_char do |char|
      index = character_set.index(char)
      if i == 0
        decrypted_message += new_character_sets_hash[:a].values_at(index).pop
        i += 1
      elsif i == 1
        decrypted_message += new_character_sets_hash[:b].values_at(index).pop
        i += 1
      elsif i == 2
        decrypted_message += new_character_sets_hash[:c].values_at(index).pop
        i += 1
      elsif i == 3
        decrypted_message += new_character_sets_hash[:d].values_at(index).pop
        i = 0
      end
    end
    decrypted_message
  end

  def gather_decryption_hashes(key, date)
    key = Key.new.generate_key_hash(key)
    offset = Offset.new.generate_offset_hash(date)
    shift = Shift.new.generate_shift_hash(key, offset)
    new_character_sets_hash = generate_new_decryption_character_sets(shift)
  end

  def generate_new_decryption_character_sets(shift)
    character_sets_hash = {}
    shift.each do |k,v|
      character_sets_hash[k] = character_set.rotate(-v)
    end
    character_sets_hash
  end

end
