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
  def self.vowel?(char)
    %w[a e i o u].include?(char)
  end
end

class Word
  def self.do_shatro(word)
    chars = word.chars
    index_first_vowel = nil

    loop do
      index_first_vowel = index_first_vowel.nil? ? 0 : index_first_vowel + 1
      break if Character.vowel?(chars[index_first_vowel])
    end

    first_syllable = word[0, index_first_vowel + 1]
    second_syllable = word[index_first_vowel + 1, word.length - 1]

    second_syllable + first_syllable
  end
end

class Solution
  def self.accept(sentence)
    words = sentence.split(/\W+/)
    result = ''

    words.each { |word| result += " #{Word.do_shatro(word)}" }
    result[1, result.length - 1]
  end
end

def shatro(sentence)
  Solution.accept(sentence)
end
