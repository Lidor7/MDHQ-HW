Sudoku Solver

Example usage: cat tests/boards/difficult.csv | ./solve 
To run the tests: ruby tests/sudoku_board_test.rb

The solve program will do validation on the input to make sure it looks like a Sudoku puzzle.  It ensures that the puzzle is 9x9 and only contains 1-9 and - characters.  It does not validate whether provided puzzle already violates the constraints of the Sudoku puzzle (i.e. already contains two of the same value in the same row).  In such cases the behavior is undefined (it may finish the puzzle or declare there is no solution, depending on which spaces are left blank).  Also, the program will only return one solution.  In cases where there are multiple solutions, it simply presents the first solution it comes across.

If I had more time and this was a more serious project I would give it a proper test framework and possibly better test coverage.


1. How does your algorithm work?

The algorithm iterates over each blank space and considers what are possible values given the three constraints that each row, column, and sector (3x3 grid) has to contain the numbers 1 through 9 exactly once.  It considers what numbers are missing from each constraint and does an intersection between the three sets of numbers to determine a set of possible values can fill that blank space.

From there, the algorithm just iterates over each possible value for each blank space, filling in the blank spaces as it goes.  Once a blank space no longer has any possible values, it means it failed to find a solution for that given set of possible values.  It then backtracks and unfills the previous space and continues to exhaust all other possible values.  Once there are no longer any blank spaces, the puzzle is solved.


2. Give and explain the big-O notation of the best, worst, and expected run-time of your program.

First, let's discuss what n would be in the big-O notation.  Since Sudokus are always the same in size, it might be argued that big-O notation doesn't apply here because the problem doesn't scale at all.

Now let's suppose that maybe n is the number of blank spaces in the puzzle.  Each space has to be considered, so that is n.  Within each blank space, my algorithm checks the three constraints across, up/down, and within the sector in order to determine possible values.  Each check is not a function of n and has a limited scope of just 9 values.  Once possible values are determined, the algorithm iterates through them and builds out the board as if it were the correct answer.

If we call the average number of possible values per blank spot m, the runtime would be m ^ n.  There are n spaces each with m possible values.  This could be considered depth-first search type algorithm with a branching factor of m and depth of n.  So the runtime would be O(m^n) where m is the average number of possible values for each space and n is the number of blank spaces.

So what's the best, worst, and expected runtime?  The best is if there was always exactly one possible value for each blank space that we had to consider.  This would be O(n).  The worst is if all nine possibilities were viable at almost every blank space but there's only one solution.  That would be O(9^n).  The expected runtime would be closer to O(5^n), but potentially even better because as the puzzle gets solved, there tends to be fewer and fewer possibilities for the remaining spaces.


3. There are a few considerations.   First, unless there's a strong indication that performance will be an issue, I usually pick an algorithm that can be written as clearly and understandable as possible.  In these kinds of cases, clarity and maintainability is my priority.  Given that the assignment did not stress the need for performance and that Sudoku puzzles are very finite in size (9x9), any algorithm that wasn't egregiously slow would seem acceptable performance-wise.

It seemed to make sense to create a SudokuBoard class to contain the board state and provide useful accessor and setter type methods.  Once a board is established, it made sense to create a class that was responsible for manipulating the board and determining possible solutions.  The solve program itself uses these two classes and is responsible for validating and translating the input into a SudokuBoard object.


4. What are some other decisions you could have made.  How might they have been better?  How might they have been worse?

I decided that speed was not important.  The algorithm I selected is probably not the fastest.  I could have scanned all the blank spaces and calculated possible values and started by filling in the blank space with the fewest possible values.  This would reduce the branching factor.  I actually haven't personally ever done any Sudokus, but I'm under the impression that most Sudokus have one blank space that only has one possible value, which then leads to revealing another space with only one possible value.  This would have made the algorithm faster, but I felt the extra complexity would have taken more time to code and would also lead to less readable and more bug-prone code.

I didn't define very many classes or custom data structures.  I maybe could have defined a SudokuSector class that would be responsible for determining what values were within a sector and also potentially increase readability (the get_sector_values() method is not very readable at all).  However, it's not immediately apparent to me how a SudokuSector class would be created and still grant easy access to row and column values.

I could have also defined a Coordinate class or used a hash with :x and :y symbols (e.g. { x: 1, y: 4 }) instead of using an array of [x, y] or separate values in methods like fill().  It might increase readability especially we anticipate that kind of data structure being used in future methods.  However I felt with its limited use, the extraneous syntax would have created more clutter than helped.

Additionally, I could have defined a static method to construct a SudokuBoard from a csv string.  I chose not to because I was able to validate and process the csv at the same time.  This couples the two functions together, but it's not too complex and probably more efficient.  I think that creating a validator class could be handy, though, especially if we wanted the validation functionality to be more robust and used in other programs and purposes.

Finally, as I mentioned earlier, the ad-hoc tests I made are very rough.  The output is not very helpful and can't really be used for continuous integration.  I would look into using an established testing framework and also increase the test coverage.



