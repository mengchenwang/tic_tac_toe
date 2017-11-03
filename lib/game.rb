require_relative 'board'

class Game

  attr_reader :board

  def initialize(board = Board.new)
    @board = board
  end

  def play(placement_array)
    place_mark(placement_array)
    finish_turn
  end

  def spot_available?(placement_array)
    (return false) if !spot_in_grid?(placement_array)
    (return false) if !spot_empty?(placement_array)
    return true
  end

  def spot_in_grid?(placement_array)
    (placement_array[0] < 3) && (placement_array[1] < 3)
  end

  def spot_empty?(placement_array)
    @board.spot_empty?(placement_array)
  end

  def place_mark(placement_array)
    mark = @board.currect_turn_mark
    @board.play(mark, placement_array)
  end

  def finish_turn
    if currect_player_win?
      game_over("win")
    elsif @board.board_full?
      game_over
    else
      go_to_next_turn
    end
  end

  def currect_player_win?
    @board.you_win?
  end

  def game_over(result="draw")
    result == "win" ? (return "You win!") : (return "It's a draw!")
    @board = Board.new
  end

  def go_to_next_turn
    @board.next_turn
    return "Next player's turn"
  end

  def print_grid
    p "-------------"
    @board.grid.each do |row|
      p "| #{row[0]} | #{row[1]} | #{row[2]} |"
      p "-------------"
    end
  end
end
