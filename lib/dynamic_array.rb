require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @arr = StaticArray.new(0)
  end

  def length
    length = 0
    i = 0
    while true
      break unless @arr[i]
      length += 1
      i+= 1
    end
    length
  end

  # O(1)
  def [](index)
    raise Exception("index out of bounds")
  end

  # O(1)
  def []=(index, value)
  end

  # O(1)
  def pop
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
  end

  # O(n): has to shift over all the elements.
  def shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!

    StaticArray.new(length*2)
  end
end
