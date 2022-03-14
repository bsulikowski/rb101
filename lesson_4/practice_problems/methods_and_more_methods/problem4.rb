# What is the return value of each_with_object in the following code? Why?

['ant', 'bear', 'cat'].each_with_object({}) do |value, hash|
  hash[value[0]] = value
end

# Returns {a: 'ant', b: 'bear', c: 'cat'} because it modifies and returns the empty 
# hash that we pass in as an argument