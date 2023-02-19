module Enumerable
  # Your code goes here
  def my_each_with_index
    index = 0
    self.my_each do |element|
      yield(element, index)
      index += 1
    end
    self
  end

  def my_select
    ret_array = Array.new
    self.my_each { |element| ret_array.push(element) if yield(element) }
    ret_array
  end

  def my_all?
    success = true
    self.my_each { |element| success = false unless yield(element) }
    success
  end

  def my_any?
    success = false
    self.my_each { |element| success = true if yield(element) }
    success
  end

  def my_none?
    success = false
    self.my_each { |elment| success = true if yield(elment) }
    !success
  end

  def my_count
    return self.length unless block_given? 
    count = 0
    self.my_each { |element| count += 1 if yield(element) }
    count
  end

  def my_map
    ret_array = Array.new
    self.my_each { |element| ret_array.push(yield(element)) }
    ret_array
  end

  def my_inject(initial_value)
    accumulator = initial_value
    self.my_each do |element|
      accumulator = yield(accumulator, element)
    end
    accumulator
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for i in 0...self.length
      yield(self[i])
    end
    self
  end
end