module Encryption

  def encrypt_message(message, key, date)
    encrypted_word = ""
    shift = gather_hashes(key,date)
    letters_hash = group_letters_by_shift(message)
    binding.pry
  
  end

  def gather_hashes(key, date)
    key = Key.new.generate_key_hash(key)
    offset = Offset.new.generate_offset_hash(date)
    shift = Shift.new.generate_shift_hash(key, offset)
  end

  def group_letters_by_shift(message)
    letters_hash = Hash.new("")
    i = 0
    message.each_char do |char|
      if i == 0
        letters_hash[i] += char
        i += 1
      elsif i == 1
        letters_hash[i] += char
        i += 1
      elsif i == 2
        letters_hash[i] += char
        i += 1
      elsif i == 3
        letters_hash[i] += char
        i = 0
      end
    end
    letters_hash
  end

end
