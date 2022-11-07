require_relative 'grid_display'

# creates a game obj, that stores all the relevant info about the game
class Game
  attr_accessor :filling, :grid

  def initialize
    self.filling = (1..9).to_a
    self.grid = [3, 3]
  end
end

#----

a = Game.new
b = GridDisplay.new(a).display