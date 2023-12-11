board = Array.new(8) { Array.new(8, ' ') }

board[0] = ['♜', '♞', '♝', '♛', '♚', '♝', '♞', '♜']
board[1] = Array.new(8, '♟︎')

# Setting up White pieces
board[6] = Array.new(8, '♙')
board[7] = ['♖', '♘', '♗', '♕', '♔', '♗', '♘', '♖']

p board[0][6]
