# Rbtclk
# Copyright (c) 2014 Moza USANE
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

require "open3"

module Rbtclk
  class SoundPlayer
    def initialize
      sound_file_path = File.expand_path("../../../sound/bell.mp3", __FILE__)

      @command_line = if command_exist?("afplay")
                        "afplay #{sound_file_path}"
                      elsif command_exist?("mpg123")
                        "mpg123 -q #{sound_file_path}"
                      else
                        ":" # do noghing
                      end
    end

    def play
      spawn @command_line
    end

    private

    def command_exist?(command)
      Open3.capture3("which #{command}")[2].success?
    end
  end
end
