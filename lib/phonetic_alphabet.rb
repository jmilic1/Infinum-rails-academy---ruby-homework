# Implement function that transforms a word to a series of NATO phonetic codes separated by a space
# character.
#
# Examples:
#  "Car"   => spell => "Charlie Alfa Romeo"
#  "mouse" => spell => "Mike Oscar Uniform Sierra Echo"

def nato_phonetic_alphabet # rubocop:disable Metrics/MethodLength
  {
    'a' => 'Alfa',
    'b' => 'Bravo',
    'c' => 'Charlie',
    'd' => 'Delta',
    'e' => 'Echo',
    'f' => 'Foxtrot',
    'g' => 'Golf',
    'h' => 'Hotel',
    'i' => 'India',
    'j' => 'Juliett',
    'k' => 'Kilo',
    'l' => 'Lima',
    'm' => 'Mike',
    'n' => 'November',
    'o' => 'Oscar',
    'p' => 'Papa',
    'q' => 'Quebec',
    'r' => 'Romeo',
    's' => 'Sierra',
    't' => 'Tango',
    'u' => 'Uniform',
    'v' => 'Victor',
    'w' => 'Whiskey',
    'x' => 'X-ray',
    'y' => 'Yankee',
    'z' => 'Zulu'
  }
end

def spell(word); end
