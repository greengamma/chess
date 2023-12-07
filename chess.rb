class Chess
  def initialize
    @board = Array.new(8) { Array.new(8, ' ') }
    setup_pieces
  end

  def display_board
    puts '  +-------------------------------+'
    @board.each_with_index do |row, index|
      print "#{8 - index} |"  # Row numbers
      row.each { |cell| print " #{cell} |" }
      puts "\n  +-------------------------------+"
    end
    puts '    a   b   c   d   e   f   g   h'  # Column letters
    end

  private

  def setup_pieces
    # Setting up Black pieces
    @board[0] = ['♜', '♞', '♝', '♛', '♚', '♝', '♞', '♜']
    @board[1] = Array.new(8, '♟︎')

    # Setting up White pieces
    @board[6] = Array.new(8, '♙')
    @board[7] = ['♖', '♘', '♗', '♕', '♔', '♗', '♘', '♖']
  end
end

# usage
chess_game = Chess.new
chess_game.display_board
