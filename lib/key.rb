class Key

  def initialize
  end

  def generate_random_key
    key_range = (00001..99999)
    key = key_range.to_a.sample.to_s
    if key.length != 5
      key.rjust(5,'0')
    end
    key
  end
  
end
