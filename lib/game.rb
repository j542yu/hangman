# frozen_string_literal: true

require_relative 'hangman_constants'

class HangmanGame
  include HangmanConstants

  def initialize
    @word = pick_word
    @guessed_word = Array.new(word.length, '_')
    @num_mistakes = 0
  end

  attr_reader :word, :guessed_word

  def pick_word
    words = File.readlines('google-10000-english-no-swears.txt', chomp: true)
    words.select { |word| word.length.between?(MIN_WORD_LENGTH, MAX_WORD_LENGTH) }.sample
  end

  def display_current_status
    puts "#{hangman_drawing(@num_mistakes)}\n\n"

    guessed_word.each do |letter|
      print "#{letter} "
    end
    puts ''
  end
end

HangmanGame.new.display_current_status
