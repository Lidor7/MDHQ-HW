Sudoku Solver

1. How does your algorithm work?

The algorithm iterates over each blank space and considers what are possible values given the three constraints that each row, column, and sector (3x3 grid) has to contain the numbers 1 through 9 exactly once.  It considers what numbers are missing from each constraint and does an intersection between the three sets of numbers to determine a set of possible values can fill that blank space.

From there, the algorithm just iterates over each possible value for each blank space, filling in the blank spaces as it goes.  Once a blank space no longer has any possible values, it means it failed to find a solution for that given set of possible values.  It then backtracks and unfills the previous space and continues to exhaust all other possible values.  Once there are no longer any blank spaces, the puzzle is solved.

2.  FILL IN

3. There are a few considerations.   First, unless there's a strong indication that performance will be an issue, I usually pick an algorithm that can be written as clearly and understandable as possible.  In these kinds of cases, clarity and maintainability is my priority.  Given that the assignment did not stress the need for performance and that Sudoku puzzles are very finite in size (9x9), any algorithm that wasn't egregiously slow would seem acceptable performance-wise.

FILL IN MORE

4. 
