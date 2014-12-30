# Rbtclk
# Copyright (c) 2014 Moza USANE
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

require "rbtclk"

module Rbtclk
  module ConfigLoader
    def load_config
      dot_rbtclk_in_home = File.expand_path(".rbtclk", "~")

      if File.exist?(dot_rbtclk_in_home)
        load dot_rbtclk_in_home
      else
        load File.expand_path("../../../config/default.rb", __FILE__)
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
end
