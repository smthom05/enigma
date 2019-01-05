require 'date'

class Offset

  attr_reader :offset_hash

  def initialize
    @offset_hash = {
      a: 0,
      b: 0,
      c: 0,
      d: 0
    }
  end

  def generate_offset
    offset = Date.today.strftime("%d%m%y")
  end

  def generate_offset_hash(date = offset.generate_offset)

  end
end
