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

    it 'creates a recorder for marks' do
      marks = { X: { row:[0, 0, 0], column:[0, 0, 0], diagonal:[0, 0] },
                O: { row:[0, 0, 0], column:[0, 0, 0], diagonal:[0, 0] } }
      expect(board.marks).to eq(marks)
    end
  end

  describe '#play' do
    it "place the player's mark at the placement location" do
      expect{ board.play("X", [0, 0]) }.to change { board.grid[0][0] }.to("X")
    end

    it 'calls record_mark' do
      expect(board).to receive(:record_mark)
      board.play("X", [0, 0])
    end
  end

  describe '#record_mark' do
    it "records the player's mark in the row array" do
      expect{ board.play("X", [1, 1]) }.to change { board.marks[:X][:row][1] }.to 1
    end

    it "records the player's mark in the column array" do
      expect{ board.play("X", [1, 1]) }.to change { board.marks[:X][:column][1] }.to 1
    end

    it "records the player's mark in the diagonal array" do
      expect{ board.play("X", [1, 1]) }.to change { board.marks[:X][:diagonal][0] }.to 1
    end

    it "records the player's mark in the inverse diagonal array" do
      expect{ board.play("X", [1, 1]) }.to change { board.marks[:X][:diagonal][1] }.to 1
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

  describe '#you_win?' do
    it 'returns true if someone wins' do
      board.play("X", [0, 0])
      board.play("X", [0, 1])
      board.play("X", [0, 2])
      expect(board.you_win?).to eq true
    end

    it 'returns false if no one wins' do
      expect(board.you_win?).to eq false
    end
  end

  describe '#board_full?' do
    it 'returns true if the board is full' do
      8.times { board.next_turn }
      expect(board.board_full?).to eq true
    end

    it 'returns false if the board is not full' do
      expect(board.board_full?).to eq false
    end
  end
end
