require 'matrix'
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

def row_contains_sign(board, x_row)
  sign = board[x_row][0]

  (1..2).each do |index|
    return nil if board[x_row][index] != sign
  end

  sign
end

def column_contains_sign(board, y_column)
  sign = board[0][y_column]

  (1..2).each do |index|
    return nil if board[index][y_column] != sign
  end

  sign
end

def first_diagonal_contains_sign(board)
  sign = board[0][0]

  (1..2).each do |index|
    return nil if board[index][index] != sign
  end

  sign
end

def second_diagonal_contains_sign(board)
  sign = board[2][0]

  (1..2).each do |index|
    return nil if board[2 - index][index] != sign
  end

  sign
end

def tic_tac_toe(board)
  (0..2).each do |index|
    sign = row_contains_sign(board, index) ||
           column_contains_sign(board, index)
    return sign unless sign.nil?
  end

  sign = first_diagonal_contains_sign(board) ||
         second_diagonal_contains_sign(board)
  return sign unless sign.nil?

  'D'
end
