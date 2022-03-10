# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# 1
# 2
# 2
# 3
# .uniq is a non-mutating method unless called with !, so the numbers array will be left unchanged.
# It will print each number on a new line because we are using puts.