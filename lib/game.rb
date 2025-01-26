# frozen_string_literal: true

# This class represents a command-line implementation of the classic Hangman game.
#
# In this game, the player attempts to guess a hidden word one letter at a time, with a limited
# number of incorrect guesses allowed.
class HangmanGame
  include GameSaveable
  include HangmanConstants
  include HangmanDisplayableMessages

  def initialize
    @word = pick_word.split('')
    @guessed_word = Array.new(word.length, '_')
    @num_mistakes = 0
    @past_guesses = []
  end

  attr_reader :word

  def play
    message = nil
    show_game_intro
    until @guessed_word == @word || @num_mistakes == MAX_NUM_MISTAKES
      display_current_status
      input = prompt_player(message)
      message = give_feedback(input)
    end
    exit_game
  end

  def pick_word
    words = File.readlines('google-10000-english-no-swears.txt', chomp: true)
    words.select { |word| word.length.between?(MIN_WORD_LENGTH, MAX_WORD_LENGTH) }.sample
  end

  def prompt_player(message)
    puts message unless message.nil?

    show_past_guesses unless @past_guesses.empty?

    show_possible_decisions

    loop do
      input = ask_for_decision
      return input if valid_guess?(input)
    end
  end

  def ask_for_decision
    print '=> '
    gets.chomp.downcase.tap do |input|
      handle_commands(input)
    end
  end

  def handle_commands(input)
    if input == 'save'
      save_game
    elsif input == 'end'
      exit_game
    end
  end

  def valid_guess?(input)
    if !input.match?(/[a-z]/)
      warn_not_letter
    elsif input.length != 1
      warn_too_long
    elsif @past_guesses.include?(input)
      warn_already_tried
    else
      return true
    end
    false
  end

  def correct?(guess)
    if @word.include?(guess)
      @guessed_word.each_with_index do |_, index|
        @guessed_word[index] = guess if word[index] == guess
      end
      true
    else
      @past_guesses << guess
      @num_mistakes += 1
      false
    end
  end

  def exit_game
    game_over = @num_mistakes == MAX_NUM_MISTAKES || @guessed_word == @word
    if game_over
      display_end_message
    else
      display_exit_message
    end
    exit
  end
end
