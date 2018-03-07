require_relative "board"
require_relative "human_player"
require_relative "computer_player"

class Game
  attr_reader :board
  def initialize(players)
    @board = Board.new
    @current_player, @next_player = players
  end
  def play
    render
    until board.over?
      play_turn
      render
    end
    game_over
  end
  def render
    intro
    @current_player.display(board)
  end
  private
  def game_over
    print "game over, "
    puts board.winner ? "#{board.winner} win!" : "it's a draw!"
  end
  def invalid_move?(pos)
    pos.nil? || board[pos]
  end
  def play_turn
    pos = @current_player.get_move
    return if invalid_move?(pos)
    board[pos] = @current_player.mark
    switch_players!
  end
  def switch_players!
    @current_player, @next_player = @next_player, @current_player
  end
end

def intro
  system("clear") || system("cls")
  puts "let's play tic tac toe!"
  puts
end

def init_player(role)
  print "choose computer (enter) or human (y) as #{role}: "
  gets.chomp == "" ? ComputerPlayer.new(role) : HumanPlayer.new(role)
end

if __FILE__ == $PROGRAM_NAME
  intro
  players = [init_player(:X), init_player(:O)]
  Game.new(players).play
end