# Module that stores relevant librarys for working with grid coordinates
module GridCoordinates
  # From grid_size = [row_size,collum_size], will create a Array of the grid with all indexes presented has cordinates e.g ["A1","B1","C1","A2","B2","C2"]
  def list_of_coordinates(grid_size)
    result = []
    row_size = grid_size[0]
    collum_size = grid_size[1]

    letter_coordinate = (65..(64 + collum_size)).map(&:chr)
    number_coordinate = (1..row_size)

    number_coordinate.each do |n|
      letter_coordinate.each do |l|
        result.append("#{l}#{n}")
      end
    end
    result
  end

  # Will return the index of the coordinate
  # E.g "B2", from the list_of_coordenates e.g ["A1","B1","C1","A2","B2","C2"]
  # Returns: 4
  # If coordinate doesn't exist in array then will return: -1
  def index_of_coordinate(coordinate, list_of_coordenates)
    result = list_of_coordenates.index(coordinate)
    result = -1 if result.nil?
    result
  end
end
