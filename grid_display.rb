# frozen_string_literal: true

# displays grid with cordenates and filling
class Grid
  attr_reader :row_size, :collum_size
  attr_accessor :filling

  def initialize(filling, row_size = 3, collum_size = 3)
    @filling = filling
    @row_size = row_size
    @collum_size = collum_size
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
