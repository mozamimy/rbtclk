# Rbtclk
# Copyright (c) 2014 Moza USANE
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

require "artii"
require "curses"
require "rbtclk/color_code"

module Rbtclk
  class Clock
    include ColorCode

    def initialize(font: "clb8x8", format: "%X", color: "black")
      @artii = Artii::Base.new(font: font)
      @format = format
      @color = color
    end

    def show
      begin
        view_thread = Thread.new do
          loop do
            refresh
            sleep 1
          end
        end

        input_thread = Thread.new do
          loop do
            case Curses.getch
            when "q"
              Thread.kill(view_thread)
              Thread.kill(input_thread)
            end
          end
        end

        view_thread.join
        input_thread.join
      ensure
        Curses.close_screen
      end
    end

    private

    def initialize_screen
      Curses.init_screen
      Curses.start_color
      Curses.use_default_colors
      Curses.init_pair(1, translate(@color), -1)
      Curses.curs_set(0)
    end

    def refresh
      Curses.clear
      Curses.setpos(0, 0)
      Curses.attron(Curses.color_pair(1))
      Curses.addstr(@artii.asciify(Time.now.strftime(@format)))
      Curses.refresh
    end
  end
end
