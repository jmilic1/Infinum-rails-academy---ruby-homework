# Implement a class, `Oib`, that represents one OIB number.
#
# On instantiation `Oib` constructor will be called with an oib number(a string). Constructor should
# store the code and perform initial validation of code length and code format(all characters should
# be digits). If any of the preceding constraints are not met, the constructor should raise an
# `ArgumentError` exception with appropriate message:
#   - when the code is shorter than 11 characters, `Code is too short`
#   - when the code is longer than 11 characters, `Code is too long`
#   - when the code contains characters besides digits, `Code should contain only digits`
#
# Oib class should also expose one public method, `Oib#valid?`, which checks whether code satisfies
# mathematical properties for valid OIB number(is control digit correct or not).
#
# Procedure for calculating control code is described in
#   https://regos.hr/app/uploads/2018/07/KONTROLA-OIB-a.pdf

class Oib
  attr_accessor :number

  def initialize(number)
    raise ArgumentError, 'Code is too short' if number.length < 11
    raise ArgumentError, 'Code is too long' if number.length > 11
    raise ArgumentError, 'Code should contain only digits' unless number.scan(/\D/).empty?

    @number = number
  end

  def valid? # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    digits = number.chars

    result = digits.each_with_index.inject(0) do |accumulator, pair|
      digit, index = pair
      digit = digit.to_i

      break accumulator.to_i if index == 10

      accumulator = index.zero? ? digit + 10 : accumulator + digit
      accumulator = (accumulator % 10).zero? ? 10 : accumulator % 10
      accumulator *= 2
      accumulator % 11
    end

    result = result == 1 ? 0 : 11 - result
    result == digits[10].to_i
  end
end
