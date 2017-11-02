require 'game'

describe Game do
  let(:board) { double(:board) }
  before do
    allow(board).to receive(:play)
    allow(board).to receive(:spot_empty?)
    allow(board).to receive(:next_turn)
    allow(board).to receive(:currect_turn_mark)
    allow(board).to receive(:you_win?)
  end
  subject(:game) { Game.new(board) }

  describe '#initialize' do
    it 'creates an empty board' do
      expect(game.board).to eq(board)
    end
  end

  describe '#play' do

  end

  describe '#spot_empty?' do
    it 'raise an error if spot is not empty' do
      allow(board).to receive(:spot_empty?).and_return(false)
      expect { game.spot_empty?(1) }.to raise_error("Spot not empty!")
    end
  end

  describe '#place_mark' do
    it 'calls board.play' do
      allow(board).to receive(:currect_turn_mark).and_return(1)
      expect(board).to receive(:play).with(1, 2)
      game.place_mark(2)
    end
  end

end
