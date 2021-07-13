# Implement translator to Satrovacki slang. In order to generate `satro` representation of the word
# translator should split the word on the first vowel, and then reverse the order of split parts. If
# word is (strictly) less than 3 characters long, skip the conversion to `shatro`.
#
# Examples
#   +---------------+---------------+---------------+---------------+
#   |  first vowel  |      split    |    reverse    |     shatro    |
#   +---------------+---------------+---------------+---------------+
#   |     zdravo    |     zdra vo   |     vo zdra   |     vozdra    |
#   |        ^      |               |               |               |
#   +---------------+---------------+---------------+---------------+
#   |    betonske   |   be tonske   |   tonske be   |    tonskebe   |
#   |     ^         |               |               |               |
#   +---------------+---------------+---------------+---------------+
#
# Method will be called with a string which contains series of words separated by a space
# character(eg. "krpa krpa sava sava") and it should return a string where each word is converted to
# Satrovacki slang.
# Bonus points:
# Solve the task in an object-oriented style and meet these conditions:
#   - create a Solution class which accepts the user input
#   - create a Word class which accepts only 1 word and knows how to convert it to shatro
#   - create a Character class which knows if a character is a vowel or not

class Character
  attr_accessor :char

  def initialize(char)
    @char = char
  end

  def vowel?
    %w[a e i o u].include?(char)
  end
end

class Word
  attr_accessor :word

  def initialize(word)
    @word = word
  end

  def do_shatro # rubocop:disable Metrics/AbcSize
    return word if word.length < 3

    index_first_vowel = word.chars.index { |char| Character.new(char).vowel? }
    first_syllable = word[0, index_first_vowel + 1]
    second_syllable = word[index_first_vowel + 1, word.length - 1]

    second_syllable + first_syllable
  end
end

class Solution
  attr_accessor :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def accept
    sentence.split(/\W+/).map { |word| Word.new(word).do_shatro }.join(' ').lstrip
  end
end

def shatro(sentence)
  Solution.new(sentence).accept
end
