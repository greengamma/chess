require 'json'

class Chess
  def initialize
    @board = Array.new(8) { Array.new(8, ' ') }
    @current_player = 'White'
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


  def play
    while !game_over?
      display_board
      move = get_player_input
      # break if move == 'exit'
      make_move(move)
      display_board

      switch_player
    end
  end


  def get_player_input
    puts "#{@current_player}, enter your move (e.g., 'e2 to e4'): "
    user_input = gets.chomp
    if user_input.downcase == 'save'
      save_game
      return get_player_input
    elsif user_input.downcase == 'exit'
      save_game
      exit
    else
      return user_input
    end
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
    from = { row: 8 - from[1].to_i, col: column_to_index(from[0]) }
    to = { row: 8 - to[1].to_i, col: column_to_index(to[0]) }
    return from, to
  end


  def game_over?(status = false)
    p status
    return status
  end


  def column_to_index(column)
    column.downcase.ord - 'a'.ord
  end


  def switch_player
    @current_player = @current_player == 'White' ? 'Black' : 'White'
  end

  def save_game
    game_state = {
      board: @board,
      current_player: @current_player
    }

    File.open("savegame.json", "w") do |file|
     file.write(game_state.to_json)
    end
   puts "Game saved."
   end

   def load_game
     if File.exist?("savegame.json")
      game_state = JSON.parse(File.read("savegame.json"))
      @board = game_state['board']
      @current_player = game_state['current_player']
      puts "Game loaded successfully!"
     else
      puts "No saved game found!"
     end
   end


   def load_file
    if File.exist?(@file_path)
      @dict_file = File.read(@file_path)
    else
      puts "File not found!"
    end
  end
end

# usage case
game = Chess.new
puts "Type 'load' to load a saved game or anything else to start a new game: "
input = gets.chomp.downcase

if input == 'load'
  game.load_game
else
  game.setup_pieces
end

game.play
