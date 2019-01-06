class Shift

  attr_accessor :shift_hash

  def initialize
    @shift_hash = {}
  end

  def generate_shift_hash(key_hash, offset_hash)
    key_hash.each do |key, key_value|
      @shift_hash[key] = key_value + offset_hash[key]
    end
    @shift_hash
  end

end
