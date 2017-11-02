require_relative 'board'

class Game

  attr_reader :board

  def initialize(board = Board.new)
    @board = board
  end

  def play(placement_array)
    spot_empty?(placement_array)
    place_mark(placement_array)
    game_over("win") if currect_player_win?
    game_over if @board.board_full?
    go_to_next_turn
  end

  def spot_empty?(placement_array)
    raise "Spot not empty!" unless @board.spot_empty?(placement_array)
  end

  def place_mark(placement_array)
    mark = @board.currect_turn_mark
    @board.play(mark, placement_array)
  end

  def currect_player_win?
    @board.you_win?
  end

  def game_over(result="draw")
    @board = Board.new
    result == "win" ? (return "You won!") : (return "It's a draw!")
  end

  def go_to_next_turn
    @board.next_turn
  end
end
