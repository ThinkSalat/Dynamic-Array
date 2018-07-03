require_relative "static_array"

class DynamicArray
  attr_reader :length, :capacity

  def initialize
    @capacity = 8
    @length = 0
    @arr = StaticArray.new(@capacity)
  end

  # O(1)
  def [](index)
    check_index(index)
    @arr[index]
  end

  # O(1)
  def []=(index, value)
    check_index(index)
    @arr[index] = value
  end

  # O(1)
  def pop
    empty?
    result = @arr[length]
    @length -= 1 
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    resize! if capacity == length
    @length +=1 
    @arr[length] = val
  end

  # O(n): has to shift over all the elements.
  def shift
    empty?
    i = 0
    result = @arr[0]
    while i < length
      @arr[i] = @arr[i+1]
      i+= 1
    end
    @arr[length-1] = nil
    @length -= 1
    result
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    resize! if capacity == (length - 1)
    
    i = length
    while i > 0
      @arr[i+1] = @arr[i]
      i -= 1
    end
    @length +=1
    @arr[0] = val
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def empty?
    raise 'index out of bounds' if @length == 0
  end

  def check_index(index)
    raise "index out of bounds" if index > length - 1
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity *= 2
    new_arr = StaticArray.new(capacity)
    i = 0
    while i < length 
      new_arr[i] = @arr[i]
      i += 1
    end
    @arr = new_arr
  end
end
