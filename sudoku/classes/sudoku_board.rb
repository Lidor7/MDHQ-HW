class SudokuBoard
  attr_accessor :grid
  attr_accessor :filled_coordinates

  def initialize grid
    self.grid = grid
    self.filled_coordinates = []
  end 

  def fill x, y, value
    grid[x][y] = value
    filled_coordinates << [x, y]
  end

  def unfill
    x, y = filled_coordinates.pop
    grid[x][y] = nil
  end

  def get_row_values x
    grid[x].compact
  end 

  def get_column_values y
    grid.inject([]) { |column, row|
      column << row[y]
    }.compact
  end 

  # Get values within a 3x3 sector
  def get_sector_values x, y
    until [0, 3, 6].include?(x) do
      x -= 1
    end

    until [0, 3, 6].include?(y) do
      y -= 1
    end

    values = []

    (0..2).each do |xi|
      (0..2).each do |yi|
        values << grid[x + xi][y + yi]
      end
    end
    
    values.compact
  end 

  def get_first_missing_value_coordinates
    grid.each_with_index do |row, x|
      row.each_with_index do |value, y|
        return [x, y] if value.nil?
      end
    end

    return nil
  end

  def to_s
    grid.map { |row|
      row.map { |value|
        value == '-' ? nil : value
      }.join(',')
    }.join("\n")
  end

end
