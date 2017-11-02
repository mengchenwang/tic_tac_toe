class Board

  attr_reader :grid, :turn, :marks

  def initialize
    @grid = [[8, 8, 8],
             [8, 8, 8],
             [8, 8, 8]]
    @turn = 0
    @marks = { X: { row:[0, 0, 0], column:[0, 0, 0], diagonal:[0, 0] },
               O: { row:[0, 0, 0], column:[0, 0, 0], diagonal:[0, 0] } }
  end

  def play(mark, placement_array)
    row = placement_array[0]
    column = placement_array[1]
    @grid[row][column] = mark
    record_mark(row, column)
  end

  def record_mark(row, column)
    @turn.even? ? (mark = :X) : (mark = :O)
    @marks[mark][:row][row] += 1
    @marks[mark][:column][column] += 1
    (@marks[mark][:diagonal][0] += 1) if (row == column)
    (@marks[mark][:diagonal][1] += 1) if (row + column == 2)
  end

  def spot_empty?(placement_array)
    row = placement_array[0]
    column = placement_array[1]
    (@grid[row][column] == 8) ? true : false
  end

  def next_turn
    @turn += 1
  end

  def currect_turn_mark
    @turn.even? ? (return "X") : (return "O")
  end

  def you_win?
    @marks.values.map(&:values).flatten.include?(3)
  end

  def board_full?
    @turn == 8
  end
end
