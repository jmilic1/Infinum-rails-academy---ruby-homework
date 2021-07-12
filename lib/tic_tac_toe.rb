# Implement a function which detects the winner of a tic-tac-toe game. The function accepts a single
# argument, a board(represented as an array), with position markers for both players. There are
# three possible values for a marker on board, 'X', 'O' or nil(nobody marked that field). The board
# is encoded as an array of three elements. Each element in the board array represents one row and
# each row contains three elements which represent the columns. The function should return a winner
# marker 'X', 'O', or 'D' in case of a draw (nobody won).
#
# Eg:
#  X | O | X    [ ['X', 'O', 'X'],
# ---+---+---
#    | X | O      [nil, 'X', 'O'],
# ---+---+---
#  X | O |        ['X', 'O', nil] ]
#
#  winner is 'X'

BOUND = 3

def sequence_contains_only_sign(board, start_x, start_y, increment_x, increment_y)
  x = start_x
  y = start_y
  sign = board[x][y]

  loop do
    return nil if board[x][y] != sign

    x += increment_x
    y += increment_y
    break unless x < BOUND && y < BOUND
  end

  sign
end

def tic_tac_toe(board)
  (0..2).each do |index|
    sign = sequence_contains_only_sign(board, 0, index, 1, 0) ||
           sequence_contains_only_sign(board, index, 0, 0, 1)
    return sign unless sign.nil?
  end

  sign = sequence_contains_only_sign(board, 0, 0, 1, 1) ||
         sequence_contains_only_sign(board, 2, 0, -1, 1)
  return sign unless sign.nil?

  'D'
end
