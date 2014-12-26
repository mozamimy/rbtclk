# Rbtclk
# Copyright (c) 2014 Moza USANE
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

require "optparse"
require "rbtclk/version"
require "rbtclk/clock"
require "rbtclk/countup_timer"
require "rbtclk/countdown_timer"

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
        opt.on("--time TIME") { |t| params[:time] = t }

        opt.parse!(args)
      end

      if params[:version]
        puts Rbtclk::VERSION
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
      when "countdown"
        remove_extra_params(params)
        timer = CountdownTimer.new(params)
        timer.show
      else
        warn "#{params[:mode]} mode is not supported."
        warn "You can use [clock, countup, countdown]."
        exit(1)
      end
    end

    def fill(params)
      {mode: params[:mode] || MODE,
       font: params[:font] || FONT,
       format: params[:format] || FORMAT,
       color: params[:color] || COLOR,
       time: params[:time] || TIME}
    end

    def remove_extra_params(params)
      params.delete(:mode)
    end

    def load_configure
      dot_rbtclk_in_home = File.expand_path(".rbtclk", "~")

      if File.exist?(dot_rbtclk_in_home)
        load dot_rbtclk_in_home
      else
        load File.expand_path("../../config/default.rb", __FILE__)
      end
    end

    # Methods for configuration DSL
    def configure(&block)
      Rbtclk.instance_eval(&block)
    end

    %w(mode font format color time).each do |attr|
      define_method "#{attr}=" do |value|
        const_set attr.to_s.upcase, value
      end
    end
  end

  load_configure
end
