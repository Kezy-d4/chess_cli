# Chess CLI

A command line chess game programmed in Ruby and accompanied by a comprehensive
RSpec test suite, this project was developed as the capstone for the Ruby course
of [The Odin Project](https://www.theodinproject.com/) curriculum. See the [lesson
and project specifications](https://www.theodinproject.com/lessons/ruby-chess).
If you are unfamiliar with chess or could use a refresher, see the [Wikipedia
article on chess](https://en.wikipedia.org/wiki/Chess).

This project proved to be a considerable challenge and thoroughly exercised my
skills in:

- Object-oriented design
- Automated unit testing
- Project planning, organization and management
- Asking questions, communicating about development and implementing feedback
- Refactoring
- Debugging
- Version control
- and more...

## Getting Started

Assuming Ruby is installed in a supported environment:

- Clone this repository onto your local machine.
- `cd` into the cloned repo.
- Install the necessary dependencies and Ruby version.
- Run the main file to play.

For example:

## Features

### Responsive User Interface and Display

This software features a responsive user interface and display that informs the
user with helpful feedback, validates inputs and prevents illegal moves according
to the rules of chess.

### Check

Check the opponent by attacking their king, but leaving them with at least one
legal move.

### Checkmate

Checkmate the opponent by giving check to their king and leaving them without
any legal moves.

### Stalemate

The game draws by stalemate when the player to act is not in check, but has no
legal moves.

### Draw by Fifty-Move and Threefold Repetition Rules

The game draws by the fifty-move rule after fifty consecutive moves without any
captures or pawn moves, and the game draws by the threefold repetition rule when
an identical position has been repeated any three times. In the event that the
fifty-move rule and checkmate are invoked simultaneously, checkmate takes
precedence.

#### Note

Typically in chess, the game is an automatic draw only by the seventy-five-move
or fivefold repetition rules, whereas the fifty-move and threefold repetition
rules merely allow players to claim a draw if they wish. This software instead
opts for a simplified implementation of automatic draw by the fifty-move or
threefold repetition rule, eliminating draw claims.

### En Passant

Capture en passant when a pawn is in position to capitalize on an en passant
target.

### Castling

Castle kingside or queenside when rights are intact, the way is clear and the
king would not move through check.

### Promotion

Promote a pawn when moving it to its last rank.

### Double Pawn Push

Push a pawn two squares forward when moving it from its home rank.

### Save and Load

Save and exit a game in progress before any turn, then load it and continue
playing.

#### Warning

This software does not verify the integrity of the save file, nor does it save
automatically except for at the end of a game. Tampering with the save file or
exiting the program outside of the provided mechanisms may cause unexpected
behavior.

### Features Not Included

This software omits certain features you might expect either because they were
out of scope or because I decided not to pursue them. They include:

- Time control
- Draw offers
- Draw claims (see [Draw by Fifty-Move and Threefold Repetition Rules](#draw-by-fifty-move-and-threefold-repetition-rules))
- Draw by dead position

## Acknowledgements

Thank you to the various members of The Odin Project community who supported and
guided me during development.

## A Note About AI

No "generative AI" tools were used in any capacity at any point during this
project's development.
