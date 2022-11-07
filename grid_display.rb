# frozen_string_literal: true

# displays grid with cordenates and filling
class GridDisplay
  attr_accessor :filling, :row_size, :collum_size

  def initialize(filling, grid = [3, 3])
    @filling = filling
    self.row_size = grid[0]
    self.collum_size = grid [1]
    # @row_size = row_size
    # @collum_size = collum_size
  end

  def display
    choped_filling = filling
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
