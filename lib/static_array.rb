# This class just dumbs down a regular Array to be statically sized.
class StaticArray
  def initialize(length)
    @arr = [nil] * length
  end

  # O(1)
  def [](index)
    if @arr[index]
      @arr[index]
    else
      nil
    end
  end

  # O(1)
  def []=(index, value)
    if @arr[index]
      @arr[index] = value
    else
      nil
    end
  end

  protected
  attr_accessor :store
end
