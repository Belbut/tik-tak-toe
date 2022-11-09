require_relative 'grid_display'
require_relative 'player'
require_relative 'grid_coordinates'
require_relative 'input_round'
require_relative 'winnable'

# creates a game obj, that stores all the relevant info about the game
class Game
  attr_accessor :filling, :symbol, :round
  attr_reader :players, :grid, :coordinates

  include GridCoordinates
  include InputRound
  include Winnable

  def initialize
    puts 'Hello this is tik tak toe game made by Belbut'
    puts "Let's set up the game"
    @grid = [3, 3]
    @coordinates = list_of_coordinates(@grid)
    self.filling = Array.new(@grid.reduce(:*)) { '_' }
    self.symbol = %w[o x]
    self.round = 0
    @players = [Player.new(1, self), Player.new(2, self)]
    GridDisplay.new(self).display
  end

  def play
    self.round += 1
    if round.odd?
      play_round(players[0])
    else
      play_round(players[1])
    end
    GridDisplay.new(self).display
  end

  def game_run
    play
    winner_symbol = winner_symbol(all_possible_winner_situations(filling, grid, 3))
    if winner_symbol
      # "we have a winner"
      player_winner = players[symbol.index(winner_symbol)]
      puts '-----------------------------'
      puts "Puts the winner of this game is -> #{player_winner.name}"
    else
      if filling.any? { |element| element == '_' }
        game_run
      else
        puts "It's a draw"
      end
    end
  end
end

loop do
  Game.new.game_run

  puts 'Wanna play again? [Y/N]'
  break if gets.chomp != 'Y'
end
