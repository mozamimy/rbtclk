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
        opt.on("--version") { |v| params[:version] = v }
        opt.on("--color COLOR") { |c| params[:color] = c }

        opt.parse!(args)
      end

      if params[:version]
        puts Rbtclk::VERSION
        exit
      else
        display_clock(params)
      end
    end

    def display_clock(params)
      params = fill(params)

      case params[:mode]
      when "clock"
        remove_extra_params(params)
        timer = Clock.new(params)
        timer.show
      when "countup"
        remove_extra_params(params)
        timer = CountupTimer.new(params)
        timer.show
      else
        warn "#{params[:mode]} mode is not supported."
        warn "You can use [clock]."
        exit(1)
      end
    end

    def fill(params)
      {mode: params[:mode] || "clock",
       font: params[:font] || "clb8x8",
       format: params[:format] || "%X",
       color: params[:color] || "black"}
    end

    def remove_extra_params(params)
      params.delete(:mode)
    end
  end
end
