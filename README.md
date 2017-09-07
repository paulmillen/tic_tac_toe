## Tic Tac Toe

Tic Tac Toe (or noughts and cross ) logic written in Ruby to satisy the following brief:

```
* There are two players in the game (X and O)
* Players take turns until the game is over
* A player can claim a field if it is not already taken
* A turn ends when a player claims a field
* A player wins if they claim all the fields in a row, column or diagonal
* A game is over if a player wins
* A game is over when all fields are taken

Build the business logic for a game of tic tac toe.
It should be easy to implement a working game of tic tac toe by combining your code with any user interface, whether web or command line.
```

### Installation

For or clone this repo.  In the program directory, in the CL:

`$ gem bundle install`
`$ bundle install`

### Instructions

To start a game in the CL:

In a ruby interpreter:

`> require './lib/game.rb'`  
`> game = Game.new`

The game defaults to X's turn first.  To place your shape in a field, enter the coordinates of the field position as arguments to game.turn(row, column).

`> game.turn(1, 1)` will place an X in the centre field, a grid being a 2d array representing the game board, thus grid[1][1].

An optional third argument to game.turn can change the current player.  The third argument must be either :X or :O.

`> game.turn(1, 1, :O)`  The next turn will default to X as the player.

An error is raised if the position has already been occupied.  
The game will return 'Draw' if the grid is filled without there being a winner.
The winner is declared if a player makes three in a row.
