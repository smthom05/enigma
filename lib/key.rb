class Key

  attr_reader :key_hash

  def initialize
    @key_hash = {
      a: 0,
      b: 0,
      c: 0,
      d: 0
    }
  end

  def generate_random_key
    key_range = (00001..99999)
    key = key_range.to_a.sample.to_s
    if key.length != 5
      key.rjust(5,'0')
    end
    key
  end

  def generate_key_hash(key)
    @key_hash = {
      a: key[0,2].to_i,
      b: key[1,2].to_i,
      c: key[2,2].to_i,
      d: key[3,2].to_i,
    }
  end

end
