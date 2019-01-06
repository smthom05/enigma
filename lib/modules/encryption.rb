module Encryption

  def encrypt_message(message, key, date)
    encrypted_word = ""
    new_character_set_hash = gather_hashes(key,date)
    letters_hash = group_letters_by_shift(message)
    binding.pry


  end

  def gather_hashes(key, date)
    key = Key.new.generate_key_hash(key)
    offset = Offset.new.generate_offset_hash(date)
    shift = Shift.new.generate_shift_hash(key, offset)
    new_character_set_hash = generate_new_character_sets(shift)
  end

  def group_letters_by_shift(message)
    letters_hash = Hash.new("")
    i = 0
    message.each_char do |char|
      if i == 0
        letters_hash[:a] += char
        i += 1
      elsif i == 1
        letters_hash[:b] += char
        i += 1
      elsif i == 2
        letters_hash[:c] += char
        i += 1
      elsif i == 3
        letters_hash[:d] += char
        i = 0
      end
    end
    letters_hash
  end

  def generate_new_character_sets(shift)
    character_set_hash = {}
    shift.each do |k,v|
      character_set_hash[v] = character_set.rotate(v)
    end
    character_set_hash
  end


end
