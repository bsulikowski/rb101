# How does take work? Is it destructive? How can we find out?

arr = [1, 2, 3, 4, 5]
arr.take(2)

# We can find out by looking up Array#take documentation. It is not destructive, and 
# works by returning a new array with the first n number of items from array it was called on.
# Will return [1, 2]