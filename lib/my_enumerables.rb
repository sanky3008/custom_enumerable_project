module Enumerable
  # Your code goes here
  def my_each_with_index
    for i in 0..(self.length - 1)
      yield(self[i], i)
    end
    return self
  end

  def my_all?
    ans = true
    self.each do |elem|
      ans = ans & yield(elem)
    end
    ans
  end

  def my_any?
    return true unless block_given?
    ans = false
    self.each do |elem|
      ans = ans | yield(elem)
    end
    ans
  end

  def my_count
    return self.length unless block_given?
    ans = 0
    self.each do |elem|
      ans = ans + 1 if yield(elem)
    end
    ans
  end

  def my_inject(init)
    return nil unless block_given?
    if init
      ans = init
    else
      ans = 0
    end
    self.each do |elem|
      ans = yield(ans, elem)
    end
    ans
  end

  def my_map
    return nil unless block_given?
    ans = []
    for elem in self do
      ans << yield(elem)
    end
    ans
  end

  def my_none?
    ans = true
    self.each do |elem|
      ans = ans & !yield(elem)
    end
    ans
  end

  def my_select
    return nil unless block_given?
    ans = []
    self.each do |elem|
      ans << elem if yield(elem)
    end
    ans
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for elem in self do
      yield(elem)
    end
    return self
  end
end
