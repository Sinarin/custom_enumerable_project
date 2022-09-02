module Enumerable
  def my_each_with_index
    index = 0
    self.my_each do |element| 
      yield(element, index)
      index += 1
    end
  end

  def my_select
    array = []
    self.my_each do |element|
      if yield(element)
        array << element
      end
    end
    array
  end

  def my_all?
    self.my_each do |element| 
      unless yield(element)
        return false
      end
    end
    return true
  end

  def my_any?
    self.my_each do |element|
      if yield(element)
        return true
      end
    end
    return false
  end

  def my_none?
    self.my_each do |element|
      if yield(element)
        return false
      end
    end
    return true
  end

  def my_count
    if block_given?
      count = 0
      self.my_each do |element|
        if yield(element)
          count += 1
        end
      end
      return count
    else
      self.length
    end
  end

  def my_map
    array = []
    self.my_each do |element|
      array.push yield(element)
    end
    array
  end

  def my_inject(initial_operand = (default = true; self.first))
    if default
      self.my_each_with_index do |element, index|
        if index == 0
          next
        end
        initial_operand = yield(element, initial_operand)
      end
      initial_operand
    else
      self.my_each do |element|
        initial_operand = yield(element, initial_operand)
      end
      initial_operand
    end
  end


end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    if block_given?
      for element in self
        yield(element)
      end
    end
  end

end
