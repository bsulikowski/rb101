# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# We can find out by looking up documentation for Hash#shift. It will remove the first key value pair
# from the hash, and return it as an array with the key and value as elements in it.