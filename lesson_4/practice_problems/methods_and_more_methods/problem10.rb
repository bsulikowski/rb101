# What is the return value of the following code? Why?

[1, 2, 3].map do |num|
  if num > 1
    puts num
  else
    num
  end
end

# Returns [1, nil, nil] because map will always return a new array. The else statement was true
# for the first iteration, and num returns a value. The following iterations, the puts statements
# return nil values to the array being returned by map.