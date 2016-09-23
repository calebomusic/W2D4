def first_anagram?(str1, str2)
  permutations = []

  str1.split("").permutation do |string|
    permutations << string.join("")
  end

  permutations.include?(str2)
end

def second__anagram?(str1, str2)
  str1_dup = str1.dup
  str2_dup = str2.dup

  str1.split('').each do |l1|
    str2.split('').each do |l2|
      if l1 == l2
        str1_dup.delete!(l1)
        str2_dup.delete!(l2)
      end
    end
  end

  str1_dup.empty? && str2_dup.empty?
end

def third_anagram?(str1, str2)
  str1 = str1.split('').sort
  str2 = str2.split('').sort

  str1 == str2
end

def fourth_anagram?(str1, str2)
  str1_hash = Hash.new(0)
  str2_hash = Hash.new(0)

  str1.split('').each do |l|
    str1_hash[l] += 1
  end

  str2.split('').each do |l|
    str2_hash[l] += 1
  end

  str1_hash == str2_hash
end

def fourth_anagram_bonus(str1, str2)
  hash = Hash.new{|k, v| k[v] = Array.new(2){0} }
  
  str1.split("").each do |l|
    hash[l][0] += 1
  end
  str2.split("").each do |l|
    hash[l][1] += 1
  end
  hash.values.each do |value|
    return false if value[0] != value[1]
  end
  true
end
