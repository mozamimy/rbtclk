# Rbtclk
# Copyright (c) 2014 Moza USANE
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

require "rbtclk"

module Rbtclk
  module ConfigLoader
    def load_config
      dot_rbtclk_in_home = File.expand_path(".rbtclk", "~")

      load File.expand_path("../../../config/default.rb", __FILE__)
      load dot_rbtclk_in_home if File.exist?(dot_rbtclk_in_home)
    end

    # Methods for configuration DSL
    def configure(&block)
      self.instance_eval(&block)
    end

    %w(mode font format color time no_alarm).each do |attr|
      define_method "#{attr}=" do |value|
        const_name = attr.to_s.upcase

        remove_const const_name if const_defined?(const_name)
        const_set const_name, value
      end
    end
  end
end
