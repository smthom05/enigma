require 'date'

class Offset

  attr_reader :offset_hash

  def initialize
    @offset_hash = {}
  end

  def generate_offset
    offset = Date.today.strftime("%d%m%y")
  end

  def generate_offset_hash(date = offset.generate_offset)
    date_squared = date.to_i ** 2
    offset_values = date_squared.to_s[-4,4]
    @offset_hash = {
      a: offset_values[0].to_i,
      b: offset_values[1].to_i,
      c: offset_values[2].to_i,
      d: offset_values[3].to_i
    }
  end
end
