def combine_anagrams(words)
  def anagrams?(first,second)
    first = first.downcase.chars.sort { |a, b| a.casecmp(b) } .join
    second = second.downcase.chars.sort { |a, b| a.casecmp(b) } .join
    return  first == second
  end


  return words.collect { |word| words.select { |another_word| anagrams?(word,another_word) } } .uniq

end

p combine_anagrams ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream']
p combine_anagrams []