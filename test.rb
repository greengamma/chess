BOARD = Array.new(8) { Array.new(8, ' ') }

def make_move(move)
  from, to = parse_move(move)

  piece = BOARD[from[:row]][from[:col]]
  BOARD[from[:row]][from[:col]] = ' '
  BOARD[to[:row]][to[:col]] = piece
end


def parse_move(move)
  from, to = move.split(' to ')
  from = { col: column_to_index(from[0]), row: 8 - from[1].to_i }
  to = { col: column_to_index(to[0]), row: 8 - to[1].to_i }
  return from, to
end

def column_to_index(column)
  column.downcase.ord - 'a'.ord
end

# USAGE
move = 'e2 to e4'
make_move(move)
