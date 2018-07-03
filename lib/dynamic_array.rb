require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @arr = StaticArray.new(4)
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
    # raise Exception,.new("index out of bounds") unless length > index
    raise Exception,  "index out of bounds" unless length > index
    @arr[index]
  end

  # O(1)
  def []=(index, value)
    # raise Exception,.new("index out of bounds") unless length > index
    raise Expection "index out of bounds" unless length > index
    @arr[index] = value
  end

  # O(1)
  def pop
    raise Exception, "index out of bounds" if length == 0
    result = @arr[length-1]
    @arr[length-1] = nil
    result
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if @arr[length-1]
    @arr[length] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    raise Exception, "index out of bounds" 
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
    new_arr = StaticArray.new(length*2)
    i = 0
    while i < length 
      new_arr[i] = @arr[i]
      i += 1
    end
    return new_arr
  end
end
