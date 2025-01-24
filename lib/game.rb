# frozen_string_literal: true

require_relative 'hangman_constants'

class HangmanGame
  include HangmanConstants

  def initialize
    @word = pick_word.split('')
    @guessed_word = Array.new(word.length, '_')
    @num_mistakes = 0
  end

  attr_reader :word

  def play
    message = give_game_intro
    until @guessed_word == @word || @num_mistakes == MAX_NUM_MISTAKES
      display_current_status
      guess = player_make_guess(message)
      message = give_feedback(guess)
    end
    display_current_status
    # end_game
  end

  def pick_word
    words = File.readlines('google-10000-english-no-swears.txt', chomp: true)
    words.select { |word| word.length.between?(MIN_WORD_LENGTH, MAX_WORD_LENGTH) }.sample
  end

  def player_make_guess(feedback)
    puts feedback unless feedback.nil?
    puts "\nThe secret word is #{@word.length} letters long."
    puts 'What letter do you want to test?'
    ask_for_letter_guess
  end

  def ask_for_letter_guess
    loop do
      print '=> '
      guess = gets.chomp.downcase
      return guess if guess.=~(/[a-z]/)

      puts '\nInvalid guess... Please guess a letter from a to z!'
    end
  end

  def validate_and_update(guess)
    if @word.include?(guess)
      @guessed_word.each_with_index do |_, index|
        @guessed_word[index] = guess if word[index] == guess
      end
      true
    else
      @num_mistakes += 1
      false
    end
  end

  def give_feedback(guess) # rubocop:disable Metrics/MethodLength
    got_correct_letter = validate_and_update(guess)
    if got_correct_letter
      "\nYay! '#{guess}' is in the secret word"
    else
      num_mistakes_left = MAX_NUM_MISTAKES - @num_mistakes
      result = "\nUh oh... '#{guess}' isn't in the secret word :("
      result += if num_mistakes_left.zero?
                  'Your next mistake will kill hangman.'
                else
                  "\nYou can make #{num_mistakes_left} more mistake(s) before hangman dies."
                end
      result
    end
  end

  def give_game_intro
    puts 'Welcome to Hangman!'
    puts 'The computer will generate a secret code, which you have to guess ' \
    'letter by letter to save hangman.'
    puts 'On your seventh mistake, he dies.'
  end

  def display_current_status
    puts "\n#{hangman_drawing(@num_mistakes)}\n\n"

    return if @num_mistakes == MAX_NUM_MISTAKES

    @guessed_word.each do |letter|
      print "#{letter} "
    end
    puts "\n"
  end
end

HangmanGame.new.play
