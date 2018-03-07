class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(3){ Array.new(3) }
  end
  def [](pos)
    x, y = pos
    grid[x][y]
  end
  def []=(pos, mark)
    x, y = pos
    grid[x][y] = mark
  end
  def winner
    [:X, :O].each{ |mark| return mark if won?(mark) }
    false
  end
  def over?
    winner || full?
  end
  def display
    grid.each_with_index do |row, i|
      line = row.map.with_index{ |x, j| x ? x : i * 3 + j + 1 }
      puts " " + line.join(" | ")
      puts "--- --- ---" unless i == 2
    end
    puts
  end
  private
  def full?
    grid.flatten.all?
  end
  def won?(mark)
    line = Array.new(3, mark)
    row = grid.any?{ |row| row == line }
    col = grid.transpose.any?{ |col| col == line }
    diag = diags.any?{ |diag| diag == line }
    row || col || diag
  end
  def diags
    cross = [[[0, 0], [1, 1], [2, 2]], [[0, 2], [1, 1], [2, 0]]]
    cross.map do |line|
      line.map{ |pos| self[pos] }
    end
  end
end