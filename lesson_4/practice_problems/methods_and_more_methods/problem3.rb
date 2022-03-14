# What is the return value of reject in the following code? Why?

[1, 2, 3].reject do |num|
  puts num
end

# The return value is [1, 2, 3] because puts num is a falsey statement,
# the block will always evaluate as false and no array elements will be rejected