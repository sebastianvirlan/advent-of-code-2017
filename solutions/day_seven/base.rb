# frozen_string_literal: true

module DaySeven
  class Base
    def input_map
      @input.split(/\n+/).map do |val|
        matches = val.match(/^(\w+)\s+\((\d+)\)(?:\s->\s(.*))?/)
        details = { val: matches[2].to_i }
        details[:children] = matches[3] ? matches[3].delete(' ').split(',') : []
        [matches[1], details]
      end.to_h
    end
  end
end
