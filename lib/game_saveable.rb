# frozen_string_literal: true

# This module handles using JSON serialization
# to save the game and opening a saved game upon launching
module GameSaveable
  require 'json'
  SAVE_FOLDER_NAME = 'saves'

  def serialize
    obj = {}
    instance_variables.map do |variable|
      obj[variable] = instance_variable_get(variable)
    end

    obj.to_json
  end

  def save_game
    Dir.mkdir(SAVE_FOLDER_NAME) unless Dir.exist?(SAVE_FOLDER_NAME)

    file_contents = serialize

    num_of_saves = Dir.entries(SAVE_FOLDER_NAME).size - 2

    filename = "saves/save_#{num_of_saves + 1}.json"

    File.open(filename, 'w') do |file|
      file.puts file_contents
    end

    confirm_saved(filename)
  end

  def unserialize(file_contents)
    obj = JSON.parse(file_contents)
    obj.each_key do |key|
      instance_variable_set(key, obj[key])
    end
  end

  def open_saved_game
    if !Dir.exist?(SAVE_FOLDER_NAME) || Dir.empty?(SAVE_FOLDER_NAME)
      warn_no_saves
      return
    end

    filename = ask_which_save
    unserialize(File.read("saves/#{filename}"))

    confirm_opened_save(filename)
  end

  def ask_which_save
    files = Dir.children(SAVE_FOLDER_NAME)

    show_saves(files)

    puts "\nWhich save would you like to open?"
    loop do
      print '=> '
      filename = gets.chomp
      filename = "#{filename}.json"
      return filename if files.include?(filename)

      warn_invalid_filename
    end
  end
end
