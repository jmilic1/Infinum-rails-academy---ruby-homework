# 1. Open Integer class and add instance method `Integer#increment` which returns new number,
#    incremented by one.

class Integer
  def increment
    to_i + 1
  end
end

# 2. Open String class and add instance method `Integer#ascii_sum` which sums ASCII codes for each
#    character.
#
# Example
#     H  |  o  |  u  |  s  |  e
#   -----+-----+-----+-----+-----
#     72 | 111 | 117 | 115 | 101
#
#   ascii_sum = 72 + 111 + 117 + 115 + 101 = 516
#
#   hint: `String#ord`

class String
  def ascii_sum
    sum = 0
    chars.each { |char| sum += char.ord }
    sum
  end
end

# 3. Open Array class and add instance method `Array#second` which returns the second element of an
#    array.

class Array
  def second
    self[1]
  end
end
