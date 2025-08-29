# frozen_string_literal: true

require_relative "rocks/version"

module Shiny
  module Rocks
    def self.hello(name = "world")
      "💎 Hello, #{name}! From shiny-rocks v#{VERSION}"
    end
  end
end
