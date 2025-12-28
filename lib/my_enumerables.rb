module Enumerable
  # Your code goes here
  def my_each_with_index
    self.each_with_index do |element, index|
      yield(element, index)
    end
  end

  def my_select
    ret = []
    self.each do |element|
      ret << element if yield(element)
    end
    ret
  end

  def my_all?
    self.each do |element|
      return false unless yield(element)
    end
    true
  end

  def my_any?
    self.each do |element|
      return true if yield(element)
    end
    false
  end

  def my_none?
    self.each do |element|
      return false if yield(element)
    end
    true
  end

  def my_count
    return self.length unless block_given?

    counter = 0
    self.each do |element|
      counter += 1 if yield(element)
    end
    counter
  end

  def my_map
    ret = []
    self.each do |element|
      ret << yield(element)
    end
    ret
  end

  def my_inject(acc=self.first, &block) # my_reduce
    self.each do |element|
      acc = block.call(acc, element)
    end
    acc
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |element|
      yield element
    end
  end
end
