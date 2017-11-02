require 'game'

describe Game do
  let(:board) { double(:board) }
  before do
    allow(board).to receive(:play)
    allow(board).to receive(:spot_empty?)
    allow(board).to receive(:next_turn)
    allow(board).to receive(:currect_turn_mark)
  end
  subject(:game) { Game.new(board) }

  describe '#initialize' do
    it 'creates an empty board' do
      expect(game.board).to eq(board)
    end
  end

end
