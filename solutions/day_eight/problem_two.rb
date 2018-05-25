# frozen_string_literal: true

require_relative 'base.rb'

module DayEight
  class ProblemTwo < Base
    def syntax
      input_with_max_checks.unshift('max = 0').unshift(variables_declaration).push('max').join(';')
    end

    def input_with_max_checks
      @input.map { |row| "#{row};max=#{row.split[0]} if #{row.split[0]} > max" }
    end
  end
end
