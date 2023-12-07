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
    puts '    a   b   c   d   e   f   g   h'
    end


  def setup_pieces
    # Setting up Black pieces
    @board[0] = ['♜', '♞', '♝', '♛', '♚', '♝', '♞', '♜']
    @board[1] = Array.new(8, '♟︎')

    # Setting up White pieces
    @board[6] = Array.new(8, '♙')
    @board[7] = ['♖', '♘', '♗', '♕', '♔', '♗', '♘', '♖']
  end


  def get_player_input
    puts "Player 1, enter your move (e.g., 'e2 to e4'): "
    gets.chomp
  end


  def make_move(move)
    from, to = parse_move(move)
    # return unless valid_move?(from, to)

    piece = @board[from[:row]][from[:col]]
    @board[from[:row]][from[:col]] = ' '
    @board[to[:row]][to[:col]] = piece
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
end

# usage
chess_game = Chess.new
chess_game.display_board
player_input = chess_game.get_player_input
chess_game.make_move(player_input)
chess_game.display_board
