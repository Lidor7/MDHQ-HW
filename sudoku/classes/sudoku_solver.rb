require_relative 'sudoku_board.rb'

class SudokuSolver
  attr_accessor :board

  def initialize board
    self.board = board
  end

  def solve
    x, y = board.get_first_missing_value_coordinates

    return board if x.nil? # No missing values means it's already solved

    possible_values = possible_values_for_coordinates x, y

    possible_values.each do |possible_value|
      # See if we can solve with this possible_value.
      board.fill(x, y, possible_value)
      solution = solve

      # No solution with this possible_value?  Backtrack and unfill possible_value.
      return solution if !solution.nil? 
      board.unfill
    end

    return nil # No solution found
  end

  def get_missing_row_values x
    (1..9).to_a - board.get_row_values(x)
  end 

  def get_missing_column_values y
    (1..9).to_a - board.get_column_values(y)
  end 

  def get_missing_sector_values x, y
    (1..9).to_a - board.get_sector_values(x, y)
  end 

  def possible_values_for_coordinates x, y
    possible_x_values = get_missing_row_values x
    possible_y_values = get_missing_column_values y
    possible_sector_values = get_missing_sector_values x, y

    possible_x_values & possible_y_values & possible_sector_values
  end

end

