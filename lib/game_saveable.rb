# frozen_string_literal: true

# This module handles using JSON serialization
# to save the game and opening a saved game upon launching
module GameSaveable
  require 'json'

  def serialize
    obj = {}
    instance_variables.map do |variable|
      obj[variable] = instance_variable_get(variable)
    end

    obj.to_json
  end

  def save_game
    Dir.mkdir('saves') unless Dir.exist?('saves')

    file_contents = serialize

    num_of_saves = Dir.entries('saves').size - 2

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
    if !Dir.exist?('saves') || Dir.empty?('saves')
      warn_no_saves
      return
    end

    show_saves
    filename = ask_which_save
  end
end
