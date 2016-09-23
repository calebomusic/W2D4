def windowed_max_range(array, w)
  current_max_range = nil

  array.each_cons(w) do |window|
    max = window.max
    min = window.min
    diff = max - min

    current_max_range ||= diff

    current_max_range = diff if diff > current_max_range
  end

  current_max_range
end

class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store << el
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def empty?
    @store.empty?
  end

  def size
    @store.length
  end
end

class MinMaxStack
  def initialize
    @store = []
  end

  def pop
    @store.pop
  end

  def push(el)
    max = el if empty? || max < el
    min = el if empty? || min > el

    @store.push({ :max => max, :min => min})
  end

  def max
    return nil if empty?
    peek[:max]
  end

  def min
    return nil if empty?
    peek[:min]
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end
end

class StackQueue
  def initialize
    @stack1 = MyStack.new
    @stack2 = MyStack.new
  end

  def enqueue(el)
    @stack1.push(el)
  end

  def dequeue(el)
    if @stack2.empty?
      until @stack1.empty?
        @stack2.push(@stack1.pop)
      end

      @stack2.pop
    else
      @stack2.pop
    end
  end

  def size
    @stack2.size
  end

  def empty?
    @stack2.empty?
  end
end

class MinMaxStackQueue
  def initialize(in_stack = [])
    @in_stack = in_stack
    @out_stack = []
  end

  def enqueue(el)
    if @in_stack.empty? || max < el
      max = el
    # else
    #   max = max #needs to compare both max from in_stack and out_stack
    end

    if @in_stack.empty? || min > el
      min = el
    # else
    #   min = min
    end
    @in_stack.push({ :value => el, :max => max, :min => min})
  end

  def dequeue
    last_from_in_stack = @in_stack.pop
    value = last_from_in_stack[:value]
    min = last_from_in_stack[:min]
    max = last_from_in_stack[:max]


    if @out_stack.empty?
      @out_stack.push({:value => value, :max => value, :min => value })

      until @in_stack.empty?
        value = @in_stack.pop[:value]
        @out_stack.push(:value => value, :max => max, :min => min)
      end

      @out_stack.pop
    else
      @out_stack.pop
    end
  end

  def max
  end

  def min
  end
end
