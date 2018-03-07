class HumanPlayer
  attr_reader :mark
  def initialize(mark)
    @mark = mark
    @pos = { 
      1 => [0, 0], 2 => [0, 1], 3 => [0, 2],
      4 => [1, 0], 5 => [1, 1], 6 => [1, 2],
      7 => [2, 0], 8 => [2, 1], 9 => [2, 2]
    }
  end
  def get_move
    print "place your #{mark}: "
    @pos[gets.chomp.to_i]
  end
  def display(board)
    board.display
  end
end