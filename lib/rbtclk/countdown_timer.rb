# Rbtclk
# Copyright (c) 2014 Moza USANE
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

require "artii"
require "curses"
require "rbtclk/color_code"

module Rbtclk
  class CountdownTimer
    include ColorCode

    def initialize(font: "clb8x8", format: "%X", color: "black", time: 180)
      @artii = Artii::Base.new(font: font)
      @format = format
      @color = color
      @time = time.to_i
      @elapsed = 0
    end

    def show
      Curses.init_screen
      Curses.start_color
      Curses.use_default_colors
      Curses.init_pair(1, translate(@color), -1)
      Curses.init_pair(2, translate("magenta"), translate("black"))
      Curses.curs_set(0)

      @start_time = Time.now + 1

      begin
        view_thread = Thread.new do
          while @elapsed < @time
            refresh
            @elapsed += 1
            sleep 1
          end

          toggle_marker = true
          loop do
            blink(toggle_marker)
            is_even = !is_even
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
    def refresh
      Curses.clear
      Curses.setpos(0, 0)
      Curses.attron(Curses.color_pair(1))
      Curses.addstr(@artii.asciify((Time.parse("1/1") + ((@start_time + @time) - Time.now)).strftime(@format)))
      Curses.refresh
    end

    def blink(toggle_marker)
      Curses.clear
      Curses.setpos(0, 0)
      Curses.attron(Curses.color_pair(2))
      Curses.addstr(@artii.asciify(Time.parse("1/1").strftime(@format))) if toggle_marker
      Curses.refresh
    end
  end
end