# What is the return value of map in the following code? Why?

{ a: 'ant', b: 'bear' }.map do |key, value|
  if value.size > 3
    value
  end
end

# Returns [nil, 'bear'] because map always returns a new array. nil is returned because the if
# did not evaluate to true anywhere and it itself returns nil in that case