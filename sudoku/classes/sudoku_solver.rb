require_relative 'sudoku_board.rb'

class SudokuSolver
  attr_accessor :board

  def initialize board
    self.board = board
  end

  def solve
    x, y = board.get_first_missing_value_coordinates

    return board if x.nil? # No missing values means it's already solved

    possible_values = board.possible_values_for_coordinates x, y

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

end

