require 'board'

describe Board do
  subject(:board) { Board.new }

  describe '#initialize' do
    it 'creates an empty grid array' do
      empty_grid = [[nil, nil, nil],
                    [nil, nil, nil],
                    [nil, nil, nil]]
      expect(board.grid).to eq(empty_grid)
    end

    it 'sets the turn number to 0' do
      expect(board.turn).to eq 0
    end
  end

end
