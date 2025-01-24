# frozen_string_literal: true

# Contains constants used in HangmanGame class
#
# Separated to avoid cluttering HangmanGame class
module HangmanConstants
  MIN_WORD_LENGTH = 5
  MAX_WORD_LENGTH = 12
  MAX_NUM_MISTAKES = 7

  def hangman_drawing(num_mistakes) # rubocop:disable Metrics/MethodLength,Metrics/CyclomaticComplexity
    case num_mistakes
    when 0
      "————————————————————————\n" \
        "|/                     |\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        '|'
    when 1
      "————————————————————————\n" \
        "|/                     |\n" \
        "|                      ◯\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        '|'
    when 2
      "————————————————————————\n" \
        "|/                     |\n" \
        "|                      ◯\n" \
        "|                      ^\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        "|\n"
    when 3
      "————————————————————————\n" \
        "|/                     |\n" \
        "|                      ◯\n" \
        "|                      ^\n" \
        "|                     /\n" \
        "|\n" \
        "|\n" \
        "|\n" \
        "|\n"
    when 4
      "————————————————————————\n" \
        "|/                     |\n" \
        "|                      ◯\n" \
        "|                      ^\n" \
        "|                     / \\ \n" \
        "|\n" \
        "|\n" \
        "|\n" \
        "|\n"
    when 5
      "————————————————————————\n" \
        "|/                     |\n" \
        "|                      ◯\n" \
        "|                      ^\n" \
        "|                     / \\ \n" \
        "|                      |\n" \
        "|\n" \
        "|\n" \
        "|\n"
    when 6
      "————————————————————————\n" \
        "|/                     |\n" \
        "|                      ◯\n" \
        "|                      ^\n" \
        "|                     / \\ \n" \
        "|                      |\n" \
        "|                     /\n" \
        "|\n" \
        "|\n"
    when 7
      "————————————————————————\n" \
        "|/                     |\n" \
        "|                      ◯\n" \
        "|                      ^\n" \
        "|                     / \\ \n" \
        "|                      |\n" \
        "|                     / \\\n" \
        "|\n" \
        "|\n"
    end
  end
end
