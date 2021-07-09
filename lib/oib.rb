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
  def initialize(number)
    raise ArgumentError, 'Code is too short' if number.length < 11
    raise ArgumentError, 'Code is too long' if number.length > 11
    raise ArgumentError, 'Code should contain only digits' unless number.scan(/\D/).empty?

    @number = number
  end

  def valid? # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    digits = @number.chars

    result = 0
    digits.each_with_index do |digit, index|
      break if index == 10

      digit = Integer(digit)

      result = index.zero? ? digit + 10 : result + digit
      result = (result % 10).zero? ? 10 : result % 10
      result *= 2
      result %= 11
    end

    result = result == 1 ? 0 : 11 - result
    result == Integer(digits[10])
  end
end
