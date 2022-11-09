require_relative 'grid_coordinates'

# Inputs round and checks if the round is valid
module InputRound
  include GridCoordinates

  # Checks if input of player is valid, and if it wasn't played before
  def valid_input?(input_coordinate, game_obj, needs_print = true)
    index = index_of_coordinate(input_coordinate, game_obj.coordinates)
    if index.negative?
      puts "Invalid input '#{input_coordinate}' please try again:"
      return false
    end

    if game_obj.filling[index] != '_'
      puts "The house '#{input_coordinate}' is alredy filled please try another" if needs_print
      return false
    end
    true
  end

  def play_round(player_obj)
    choise = ''
    if player_obj.is_human
      puts "#{player_obj.name} turn, pick a coordenade:"
      loop do
        choise = gets.chomp
        break if valid_input?(choise, self)
      end
    else
      loop do
        choise = coordinates.sample
        if valid_input?(choise, self, false)
          puts "Computer choses:#{choise}"
          break
        end
      end
    end
    index = index_of_coordinate(choise, coordinates)
    filling[index] = player_obj.symbol
    filling
  end
end
