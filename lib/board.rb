class Board

  attr_reader :grid, :turn

  def initialize
    @grid = [[8, 8, 8],
             [8, 8, 8],
             [8, 8, 8]]
    @turn = 0
  end

  def play(mark, placement_array)
    row = placement_array[0]
    column = placement_array[1]
    @grid[row][column] = mark
  end

  def spot_empty?(placement_array)
    row = placement_array[0]
    column = placement_array[1]
    (@grid[row][column] == 8) ? true : false
  end

  def next_turn
    @turn += 1
  end
end
