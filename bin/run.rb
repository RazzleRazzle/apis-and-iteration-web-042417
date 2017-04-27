#!/usr/bin/env ruby
require 'pry'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
get_character_movies_from_api(character)
parse_character_movies(character)
show_character_movies(character)
