# frozen_string_literal: true

# This module handles displaying text to the player
# on the command line
module HangmanDisplayableMessages
  include HangmanConstants

  def show_possible_decisions
    puts "\nThe secret word is #{@word.length} letters long."
    puts "Enter the letter you want to guess, or either 'save' or 'exit'"
  end

  def warn_not_letter
    puts "\nInvalid input... Please guess a letter from a to z!"
  end

  def warn_too_long
    puts "\nYou can only guess one letter at a time. Please try again."
  end

  def warn_already_tried
    puts "\nYou've already tried this letter, it didn't work! Please try again."
  end

  def give_feedback(guess)
    return "\nYay! '#{guess}' is in the secret word" if correct?(guess)

    num_mistakes_left = MAX_NUM_MISTAKES - @num_mistakes
    feedback = "\nUh oh... '#{guess}' isn't in the secret word :("
    if num_mistakes_left.zero?
      "#{feedback}\nYour next mistake will kill hangman."
    else
      "#{feedback}\nYou can make #{num_mistakes_left} more mistake(s) before hangman dies."
    end
  end

  def show_game_intro
    puts 'Welcome to Hangman!'
    puts 'The computer will generate a secret code, which you have to guess ' \
    'letter by letter to save hangman.'
    puts 'On your seventh mistake, he dies.'
  end

  def show_past_guesses
    puts "\nPast incorrect guesses: '#{@past_guesses.join(', ')}'"
  end

  def display_exit_message
    puts "\nYou have closed the game."
    puts 'If you created any saves, you can pick up where you left off upon relaunching the game again.'
  end

  def display_end_message
    if @guessed_word == @word
      puts "\nCongratulations!!! You saved hangman."
    else
      puts "\nYou failed! Hangman has died."
    end
    puts "The secret word was '#{@word.join('')}'."
  end

  def display_current_status
    puts "\n————————————————————————————————————————————————\n"
    puts "\n#{hangman_drawing(@num_mistakes)}\n\n"

    return if @num_mistakes == MAX_NUM_MISTAKES

    @guessed_word.each do |letter|
      print "#{letter} "
    end
    puts "\n"
  end
end
