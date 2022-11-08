require_relative 'grid_display'
require_relative 'player'
require_relative 'grid_coordinates'
require_relative 'input_round'

# creates a game obj, that stores all the relevant info about the game
class Game
  attr_accessor :filling, :symbol, :round
  attr_reader :player1, :player2, :grid, :coordinates

  include GridCoordinates
  include InputRound

  def initialize
    @grid = [3, 3]
    @coordinates = list_of_coordinates(@grid)
    self.filling = Array.new(@grid.reduce(:*)) { '_' }
    self.symbol = %w[o x]
    self.round = 0

    @player1 = Player.new(1, self)
    @player2 = Player.new(2, self)
  end

  def play
    self.round += 1
    if round.odd?
      play_round(player1)
    else
      play_round(player2)
    end
  end
end

#----

a = Game.new
GridDisplay.new(a).display

p a

p Array.new([3, 3].reduce(:*)) { '_' }

a.play
GridDisplay.new(a).display
a.play

GridDisplay.new(a).display
