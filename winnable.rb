# Winning combinations and requirements
module Winnable
  def winner_combination(filling, grid_size, goal_number_in_line)
    rows = array_to_matrix(filling, grid_size)
    collums = rows.transpose
    diagonals = all_diagonals(rows)

    rows_winnable = line_combinations(rows, goal_number_in_line)
    collums_winnable = line_combinations(collums, goal_number_in_line)
    diagonals_winnable = line_combinations(diagonals, goal_number_in_line)

    rows_winnable + collums_winnable + diagonals_winnable
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

  def diagonals_45_deg(matrix)
    right_padding = matrix.size - 1
    padded_matrix = []

    matrix.each do |row|
      left_padding = matrix.size - right_padding
      padded_matrix.append(([nil] * left_padding) + row + ([nil] * right_padding))
      right_padding -= 1
    end
    padded_matrix.transpose.map(&:compact).reject(&:empty?)
  end

  def diagonals_315_deg(matrix)
    arr = diagonals_45_deg(matrix.reverse)

    arry_left_to_right = []   # not needed but for easyer left to right reading
    arr.each { |diagonal| arry_left_to_right.append(diagonal.reverse) }
    arry_left_to_right
  end

  def all_diagonals(matrix)
    diagonals_45_deg(matrix) + diagonals_315_deg(matrix)
  end
end
