# Hangman
## Overview
Note: This was created as part of The Odin Project's Ruby course in their Ruby on Rails path.

Hangman is a classic children's game where one player must guess a secret word letter by letter, 
but every incorrect guess brings the hangman one step closer to death. If the secret word is correctly
guessed before hangman dies, the player succeeds!

## **Setting Up the Game**

This implementation is written in **Ruby (version 3.3.5)**.

### **Running Locally**
1. **Install Ruby**: If you don’t have Ruby installed, follow the official installation guide [here](https://www.ruby-lang.org/en/documentation/installation/).
2. **Clone the Repository**:
   - [Fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo) this repository.
   - [Clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) your forked repo to your local machine.
3. **Install Dependencies**:
   - Open a terminal and navigate to the project directory.
   - Run `bundle install` to install the required gems, including the _rainbow_ gem for colorful text output.
4. **Start the Game**:
   - Open a terminal and navigate to the project directory.
   - Run `ruby main.rb` to launch the game.

### **Running Remotely**
Use a remote environment like [Replit.com](https://replit.com), then upload the project files and run `ruby main.rb`.

## **How to Play**

Hangman is a classic word-guessing game where the player must guess a secret word letter by letter. Each incorrect guess brings the hangman closer to defeat. Guess the word correctly before the hangman is fully drawn to win!

### **Game Rules**
1. The computer selects a secret word and displays it as a series of dashes (e.g., `_ _ _ _` for a 4-letter word).
2. The player guesses one letter at a time.
3. If the guessed letter is in the secret word:
   - All instances of the letter are revealed.
4. If the guessed letter is not in the secret word:
   - The hangman drawing is updated, and the incorrect guess is recorded.
5. The player wins if they guess the entire word before the hangman is fully drawn. Otherwise, the hangman meets his fate, and the player loses.

## **Features**

- **New Game or Load Saved Game**: When the game launches, the player can choose to start a new game or load a previously saved game.
- **Interactive Hangman Drawing**: The hangman is drawn step by step with each incorrect guess.
- **Previous Incorrect Guesses**: The player is shown a list of incorrect guesses before making each new guess.
- **Save Progress**: The player can save their current progress at any point and resume the game later.
