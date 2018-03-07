class ComputerPlayer
  attr_reader :mark, :board
  def initialize(mark)
    @mark = mark
  end
  def get_move
    empty_lot.each{ |pos| return pos if winning_move?(pos) }
    empty_lot.sample
  end
  def display(board)
    @board = board
    board.display
  end
  private
  def winning_move?(pos)
    board[pos] = mark
    result = (board.winner == mark)
    board[pos] = nil
    return result
  end
  def empty_lot
    lot = []
    board.grid.each_with_index do |row, x|
      row.each_with_index do |pos, y|
        lot << [x, y] if pos == nil
      end
    end
    lot
  end
end