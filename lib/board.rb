class Board

  attr_reader :grid, :turn

  def initialize
    @grid = [[nil, nil, nil],
             [nil, nil, nil],
             [nil, nil, nil]]
    @turn = 0
  end


end
