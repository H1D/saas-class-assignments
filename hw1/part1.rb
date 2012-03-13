def palindrome?(string)
  raise "param must be a String" unless string.kind_of? String
  string = string.gsub(/\W/,'')
  string = string.upcase

  return string == string.reverse
end

def count_words(string)
  raise "param must be a String" unless string.kind_of? String
  count = {}
  string.downcase.scan(/\b\w+\b/){ |i| count[i] = ( count[i] ? count[i] : 0) + 1 }
  return count
end

#p 'palindrome?\n'
#p palindrome?('A man, a plan, a canal -- Panama')
#p palindrome?('Madam, I`m Adam!')
#p palindrome?('Abracadabra')
#
#p 'count_words\n'
#p count_words('dfdsfdsf f f f F s')
