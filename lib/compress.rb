# Run-length-encoding is a simple form of data compression:
#   if an element (e) occurs (n) consecutive times in input stream replace the consecutive
#   occurrences with a single pair (ne)
#
# Examples:
#   a    -> 1a
#   aa   -> 2a
#   aabb -> 2a2b
#   abc  -> 1a1b1c

def compress(input_stream) # rubocop:disable Metrics/MethodLength
  chars = input_stream.chars
  return '' if chars.length.zero?

  result = ''
  char = chars[0]
  num_of_char = 0

  chars.each do |c|
    if char != c
      result += num_of_char.to_s + char
      char = c
      num_of_char = 0
    end
    num_of_char += 1
  end

  result + num_of_char.to_s + char
end
