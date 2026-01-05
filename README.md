# Hangman

## **Running the Game**

### **Option 1: Run Remotely**
Use [Replit.com]((https://replit.com/)):
1. Create a new App
2. Select `Import from GitHub`, then enter this project's URL (https://github.com/j542yu/hangman)
3. Once the App is created, navigate to the `.replit` file from the left side bar and add this to line 2:
   ```bash
   run = ["sh", "-c", "bundle install && bundle exec ruby main.rb"]
   ```
4. Click `Run` at the top to begin playing!

### **Option 2: Run Locally**
1. **Install Ruby**: Follow the official installation guide [here](https://www.ruby-lang.org/en/documentation/installation/).
This implementation is written in Ruby version 3.3.5.
2. **Clone the Repository**:
   * [Fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/fork-a-repo) this repository.
   * [Clone](https://docs.github.com/en/repositories/creating-and-managing-repositories/cloning-a-repository) your forked repo to your local machine.
3. **Install Dependencies**:
   * Navigate to the project directory.
   * Install the required gems by running
      ```bash
      ~$ bundle install
      ```
4. **Start the Game**:
   * Launch the game by running
      ```bash
      ~$ ruby main.rb
      ```
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
