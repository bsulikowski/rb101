# Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:
  # ! is a modifier used to mean not or indicate a method will mutate its caller
  # ? is used in ternary comparisons or to indicate that a method will test for truthiness

# what is != and where should you use it?
  # means not equal to , and should be used when testing for the absence of something

# put ! before something, like !user_name
  # Use when testing to see if a variable is empty, indicates opposite of user_name 

# put ! after something, like words.uniq!
  # Use to indicate that .uniq will mutate words

# put ? before something
  # Ternary operator - test if expression before ? is truthy or not

# put ? after something
  # Used in method names to indicate it will test and return a truthy value

# put !! before something, like !!user_name
  # Used to turn an object into its boolean equivalent. 