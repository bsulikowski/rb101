# Given the following data structure use a combination of methods, including either the select
# or reject method, to return a new array identical in structure to the original but containing
# only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

multiples_of_3 = arr.map do |sub_array|
  sub_array.select { |element| element % 3 == 0 }
end

p multiples_of_3