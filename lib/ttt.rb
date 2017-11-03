require_relative 'game'

class TTT

  def initialize(game = Game.new)
    @game = game
  end

  def start_game
    p "let's play Tic-Tac_Toe"
    @game.print_grid
    p "enter your mark as 2 numbers, e.g. '0,0' is top left corner"
    while true
      input = gets.chomp
      break if input == "exit"
      placement_array = input.split(',').map! { |x| x.to_i }
      while !@game.spot_available?(placement_array)
        p "spot not available, choose another one!"
        input = gets.chomp
        break if input == "exit"
        placement_array = input.split(',').map! { |x| x.to_i }
      end
      case @game.play(placement_array)
      when "You win!"
        p "You win!"
        @game.print_grid
      when "It's a draw!"
        p "It's a draw!"
        @game.print_grid
      when "Next player's turn"
        p "Next player's turn"
        @game.print_grid
        p "enter your mark as 2 numbers, e.g. '0,0' is top left corner"
      end
    end
  end
end

ttt = TTT.new
ttt.start_game
