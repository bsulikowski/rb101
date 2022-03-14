# Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

# ex:
# { "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

letter_count = {}
statement.chars.each do |char| 
  if letter_count[char]
    letter_count[char] += 1
  else
    letter_count [char] = 1
  end
end

p letter_count