# Rbtclk
# Copyright (c) 2014 Moza USANE
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

module Rbtclk
  class SoundPlayer
    def initialize
      # TODO: We need recognizing the OS to know which command we can use to play a sound file.
      sound_file_path = File.expand_path("../../../sound/bell.mp3", __FILE__)
      @command_line = "afplay #{sound_file_path}"
    end

    # NOTE: This method is experimental.
    #       It can be executed on only OS X.
    def play
      spawn @command_line
    end
  end
end
