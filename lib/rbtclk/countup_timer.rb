require "artii"
require "curses"
require "time"

module Rbtclk
  class CountupTimer
    def initialize(font: "clb8x8", format: "%X")
      @artii = Artii::Base.new(font: font, format: "%X")
      @format = format
    end

    def show
      Curses.init_screen
      Curses.curs_set(0)
      @start_time = Time.now

      begin
        view_thread = Thread.new do
          loop do
            refresh
            sleep(1)
          end
        end

        input_thread = Thread.new do
          loop do
            case Curses.getch
            when "q"
              exit
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
      Curses.addstr(@artii.asciify((Time.parse("1/1") + (Time.now - @start_time)).strftime(@format)))
      Curses.refresh
    end
  end
end
