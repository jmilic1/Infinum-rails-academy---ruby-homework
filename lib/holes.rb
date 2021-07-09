# Implement a function that counts the number of holes(enclosed spaces) in a number. Use the
# following table as a reference for the number of holes of a specific digit. For example the input
# number 100 should return a result of 2
#
# Digit | Holes
# ------+------
#   0   |   1
#   1   |   0
#   2   |   0
#   3   |   0
#   4   |   1
#   5   |   0
#   6   |   1
#   7   |   0
#   8   |   2
#   9   |   1

def digit_holes # rubocop:disable Metrics/MethodLength
  {
    0 => 1,
    1 => 0,
    2 => 0,
    3 => 0,
    4 => 1,
    5 => 0,
    6 => 1,
    7 => 0,
    8 => 2,
    9 => 1
  }
end

def holes(number)
  i = 1
  hole_count = 0
  holes = digit_holes

  loop do
    i *= 10
    hole_count += holes[number % i / (i / 10)]
    break unless i <= number
  end

  hole_count
end
