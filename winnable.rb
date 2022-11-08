# Winning combinations and requirements
module Winnable
  def winner_combination(filling, grid_size, goal_number_in_line)
    rows = array_to_matrix(filling, grid_size)
    p collums = rows.transpose

    rows_winnable = line_combinations(rows, goal_number_in_line)
    collums_winnable = line_combinations(collums, goal_number_in_line)
  end

  private

  def line_combinations(diretion_array, goal_number_in_line)
    # diretional array is a 2D matriz
    result = []
    diretion_array.each do |sub_array|
      number_of_winnable_combination = sub_array.length - goal_number_in_line + 1
      number_of_winnable_combination.times do |i|
        result.append(sub_array[i, i + goal_number_in_line])
      end
    end
    result
  end
end
