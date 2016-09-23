def bad_two_sum?(array, target)
  array.each_with_index do |el1, i|
    array.each_with_index do |el2, j|
      unless i == j
        return true if el1 + el2 == target
      end
    end
  end
  false
end


def okay_two_sum?(array, target)
#binary search
  array.sort!
  array.each_with_index do |el, i|
    break if i == array.length / 2
    return true if el + array[-i - 1] == target
  end

  false
end

def pair_sum?(array, target)
  hash = {}

  array.each do |num|
    return true if hash[target - num]
    hash[num] = true
  end

  false
end

def four_sum?(array, target)
  hash = {}
  two_sum_hash = {}
  three_sum_hash = {}

  array.each do |num|
    return true if three_sum_hash[target - num]
    two_sum_hash.keys.each do |key|
      three_sum_hash[key + num] = true
    end
    hash.keys.each do |key|
      two_sum_hash[key + num] = true
    end
    hash[num] = true
  end
  false
end
