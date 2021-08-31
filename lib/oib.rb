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

OIB_LENGTH = 11

class Oib
  attr_accessor :number

  def initialize(number)
    raise ArgumentError, 'Code is too short' if number.length < OIB_LENGTH
    raise ArgumentError, 'Code is too long' if number.length > OIB_LENGTH
    raise ArgumentError, 'Code should contain only digits' unless number.scan(/\D/).empty?

    @number = number
  end

  def valid?
    digits = number.to_i.digits.reverse

    result = digits.each_with_index.inject(0) do |accumulator, pair|
      digit, index = pair

      break accumulator if index == OIB_LENGTH - 1

      validation_step(accumulator, digit, index)
    end

    result = result == 1 ? 0 : 11 - result
    result == digits[10]
  end

  private

  def validation_step(accumulator, digit, index)
    accumulator = index.zero? ? digit + 10 : accumulator + digit
    accumulator = (accumulator % 10).zero? ? 10 : accumulator % 10
    accumulator * 2 % 11
  end
end
