# frozen_string_literal: false

# displays grid with cordenates and filling
class GridDisplay
  attr_accessor :filling, :row_size, :collum_size

  def initialize(game_obj)
    self.filling = game_obj.filling
    self.row_size = game_obj.grid[0]
    self.collum_size = game_obj.grid[1]
  end

  def display
    choped_filling = filling.dup
    collum_legend = '   '
    (65..(64 + collum_size)).each { |i| collum_legend += "#{i.chr}   " }

    display_row = Array.new(row_size) do |index|
      row = "#{index + 1} _#{choped_filling.shift}_"
      (collum_size - 1).times { row += "|_#{choped_filling.shift}_" }
      row
    end

    puts collum_legend
    display_row.each { |row| puts row }
  end
end
