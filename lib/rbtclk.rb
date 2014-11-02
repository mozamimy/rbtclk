require "curses"
require "optparse"
require "rbtclk/version"
require "rbtclk/clock"
require "rbtclk/countup_timer"

module Rbtclk
  class << self
    def run(args)
      params = {}

      OptionParser.new do |opt|
        opt.on("--mode MODE") { |m| params[:mode] = m }
        opt.on("--format FORMAT") { |f| params[:format] = f }
        opt.on("--font FONT") { |f| params[:font] = f }

        opt.parse!(args)
      end

      case params[:mode] || "clock"
      when "clock"
        timer = Clock.new(font: params[:font] || "clb8x8", format: params[:format] || "%X")
        timer.show
      when "countup"
        timer = CountupTimer.new(font: params[:font] || "clb8x8", format: params[:format] || "%X")
        timer.show
      else
        warn "#{params[:mode]} mode is not supported."
        warn "You can use [clock]."
        exit(1)
      end
    end
  end
end
