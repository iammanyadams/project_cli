#! /usr/bin/env ruby
# frozen_string_literal: true

# An example of nested subcommands
require_relative './da.rb'
require "clamp"

class CLI
    extend Da
    attr_accessor :criteria

  def initialize(criteria:nil)
    @criteria = criteria
  end

    def menu
      Clamp do
        subcommand "foo", "foo!" do
          subcommand "do", "doo" do
            def execute
              puts "hello"
            end
          end
        end
      end
    end

end
