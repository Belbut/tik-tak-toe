# frozen_string_literal: true

# Creates the played for tik tak toe game
class Player
  attr_reader :symbol, :name, :is_human

  def initialize(player_number, game_object)
    @is_human = player?(player_number)
    @symbol = game_object.symbol[player_number -1]
    puts "Player #{player_number} created, it's #{@is_human ? 'Human' : 'Computer'}, and is playing with #{symbol}"
  end

  private

  def player?(player_number)
    puts "If left blank computer will play, else Player#{player_number} name is:"
    name_inputed = gets.chomp
    if name_inputed.empty?
      @name = 'Computer'
      false
    else
      @name = name_inputed
      true
    end
  end
end
