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

  describe '#spot_empty?' do
    it "return false if spot is already marked" do
      board.play("X", [0, 0])
      expect(board.spot_empty?([0, 0])).to eq false
    end
  end

  describe '#next_turn' do
    it 'add 1 to the turn varible' do
      expect { board.next_turn }.to change { board.turn }.by(1)
    end
  end

  describe '#currect_turn_mark' do
    it 'returns X at even turn' do
      expect(board.currect_turn_mark).to eq("X")
    end

    it 'returns O at odd turn' do
      board.next_turn
      expect(board.currect_turn_mark).to eq("O")
    end
  end
end
