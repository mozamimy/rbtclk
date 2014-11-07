require "curses"

module Rbtclk
  module ColorCode
    def translate(color_name)
      color_name = color_name.to_s
      Curses.const_get("COLOR_#{color_name.upcase}")
    end
  end
end
