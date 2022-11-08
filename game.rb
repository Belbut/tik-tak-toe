require_relative 'grid_display'
require_relative 'player'
require_relative 'grid_coordinates'
require_relative 'input_round'
require_relative 'winnable'

# creates a game obj, that stores all the relevant info about the game
class Game
  attr_accessor :filling, :symbol, :round
  attr_reader :player1, :player2, :grid, :coordinates

  include GridCoordinates
  include InputRound
  include Winnable

  def initialize
    @grid = [3, 3]
    @coordinates = list_of_coordinates(@grid)
    self.filling = Array.new(@grid.reduce(:*)) { '_' }
    self.symbol = %w[o x]
    self.round = 0

    @player1 = Player.new(1, self)
    @player2 = Player.new(2, self)
    GridDisplay.new(self).display
  end

  def play
    self.round += 1
    if round.odd?
      play_round(player1)
    else
      play_round(player2)
    end
    GridDisplay.new(self).display
  end

  def game_status
    # do we have a winner?
    # yes return winner // No check if it is a Draw?
    # is a draw - return draw && prompt new game
    # it is not a draw -> game.play
  end

 end

#----
a = Game.new


b = %w[A1 B1 C1 A2 B2 C2 A3 B3 C3 A4 B4 C4]
p a.winner_combination(b, [3, 3], 3)