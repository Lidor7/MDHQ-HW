require_relative 'test_helper.rb'
require_relative '../classes/sudoku_board.rb'
require_relative '../classes/sudoku_solver.rb'

grid = [
  [nil,   3, nil, nil, nil,   1,   7, nil, nil],
  [nil,   5,   7, nil, nil,   9,   2, nil, nil],
  [  8, nil, nil,   5,   3, nil, nil, nil,   4],
  [  7, nil, nil, nil,   8,   2,   5, nil, nil],
  [nil,   6,   8,   4, nil,   5,   3,   7, nil],
  [nil, nil,   5,   6,   7, nil, nil, nil,   9],
  [  4, nil, nil, nil,   5,   8, nil, nil,   7],
  [nil, nil,   1,   9, nil, nil,   4,   5, nil],
  [nil, nil,   6,   7, nil, nil, nil,   2, nil]
]

sb = SudokuBoard.new(grid)

assert_equals [8, 5, 3, 4], sb.get_row_values(2)
assert_equals [3, 5, 6], sb.get_column_values(1)
assert_equals [8, 2, 4, 5, 6, 7], sb.get_sector_values(3, 5)

assert_equals [1, 2, 6, 7, 9], sb.get_missing_row_values(2)
assert_equals [1, 2, 4, 7, 8, 9], sb.get_missing_column_values(1)
assert_equals [1, 3, 9], sb.get_missing_sector_values(3, 5)

solution = [
  [9, 3, 4, 2, 6, 1, 7, 8, 5],
  [6, 5, 7, 8, 4, 9, 2, 3, 1],
  [8, 1, 2, 5, 3, 7, 6, 9, 4],
  [7, 9, 3, 1, 8, 2, 5, 4, 6],
  [1, 6, 8, 4, 9, 5, 3, 7, 2],
  [2, 4, 5, 6, 7, 3, 8, 1, 9],
  [4, 2, 9, 3, 5, 8, 1, 6, 7],
  [3, 7, 1, 9, 2, 6, 4, 5, 8],
  [5, 8, 6, 7, 1, 4, 9, 2, 3]
]

solver = SudokuSolver.new(sb)

assert_equals solution, solver.solve.grid

puts "No assertions failed.  All tests passed!"
