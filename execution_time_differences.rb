def my_min(array)
  array.each_with_index do |current_el, i1|
    smallest = true
    array.each_with_index do |other_el, i2|
      smallest = false if other_el < current_el
    end

    return current_el if smallest
  end
end

def my_min2(array)
  smallest = array.first
  array.each do |el|
    smallest = el if el < smallest
  end

  smallest
end

def largest_contiguous_subsum(list)
  subsets(list).map do |subset|
    subset.inject(:+)
  end.max
end

def subsets(list)
  subsets = []

  i = 0
  j = 1

  while i < list.length
    j = i
    while j < list.length
      subsets << list[i..j]
      j += 1
    end

    i += 1
  end

  subsets
end

def largest_contiguous_subsum2(list)
  largest = list.first
  prev_sum = 0

  list.each_with_index do |el, i|

    if el > largest
      largest = el
      prev_sum = el
    else
      prev_sum += el
    end

    largest = prev_sum if prev_sum > largest
  end

  largest
end
