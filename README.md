# Hangman
## Overview
Note: This was created as part of The Odin Project's Ruby course in their Ruby on Rails path.

Hangman is a classic children's game where one player must guess a secret word letter by letter, 
but every incorrect guess brings the hangman one step closer to death. If the secret word is correctly
guessed before hangman dies, the player succeeds!

## Setting up Ruby
This implementation is written in Ruby (version 3.3.5).

To run locally:
1. Install Ruby (instructions [here](https://www.ruby-lang.org/en/documentation/installation/))
2. [Fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo) and [clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) this repo
3. Open up the command line and change your present working directory to this repo. Then, run `ruby main.rb` to begin playing!

To run remotely, utilize a remote environment such as Replit.com.

## Features
* When the game launches, the player can choose to start a new game or open up a saved game, if available
* The computer generates a secret word and draws the hangman along with dashes for each secret letter
* The player is shown previous incorrect guesses before making each guess
* After each guess made by the player
    * if correct, all instances of that letter is revealed in the secret word
    * if incorrect, the hangman drawing is updated and the incorrect guess is stored
* At any point, the player may choose to save their current progress which they can later open upon re-launching the game