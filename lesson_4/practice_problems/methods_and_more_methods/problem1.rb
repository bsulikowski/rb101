# What is the return value of the select method below? Why?

[1, 2, 3].select do |num|
  num > 5
  'hi'
end

# returns [1, 2, 3] since the last line 'hi' will always be evaluated as truthy,
# it will select all elements