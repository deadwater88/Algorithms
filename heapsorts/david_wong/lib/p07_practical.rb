require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  odds, h = 0, Hash.new(0)
  string.chars.each do |char|
    h[char] += 1
    odds +=  h[char] % 2 == 1 ? 1 : -1
  end
  odds < 2
end
