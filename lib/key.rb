class Key

  def initialize
  end

  def generate_random_key
    key_range = (00001..99999)
    key_range.to_a.sample.to_s
  end
end
