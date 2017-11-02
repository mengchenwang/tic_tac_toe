require 'board'

describe Board do
  subject(:board) { Board.new }

  describe '#initialize' do
    it 'creates an empty grid array' do
      empty_grid = [[8, 8, 8],
                    [8, 8, 8],
                    [8, 8, 8]]
      expect(board.grid).to eq(empty_grid)
    end

    it 'sets the turn number to 0' do
      expect(board.turn).to eq 0
    end
  end

  describe '#play' do
    it "place the player's mark at the placement location" do
      expect{ board.play("X", [0, 0]) }.to change { board.grid[0][0] }.to("X")
    end
  end

end
