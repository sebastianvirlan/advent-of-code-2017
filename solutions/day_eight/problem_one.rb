# frozen_string_literal: true

require_relative 'base.rb'

module DayEight
  class ProblemOne < Base
    def syntax
      @input.unshift(variables_declaration).push(variables_arr).join(';')
    end
  end
end
