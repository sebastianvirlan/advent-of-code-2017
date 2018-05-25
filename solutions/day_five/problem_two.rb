# frozen_string_literal: true

# Consider a list of the offsets for each jump. Jumps are relative: -1 moves to the previous instruction, and 2 skips
# the next one. Start at the first instruction in the list. The goal is to follow the jumps until one leads outside
# the list.

# In addition, these instructions are a little strange; after each jump, if the offset was three or more, instead
# decrease it by 1. Otherwise, increase it by 1 as before.

# Using this rule with the DayFive::Problem1 example, the process now takes 10 steps, and the offset values after
# finding the exit are left as 2 3 2 3 -1.
# Return the number of steps

module DayFive
  class ProblemTwo
    def initialize(input)
      @jump_offsets = input.split(/\n+/).map(&:to_i)
      @steps = 0
    end

    def resolve
      index = 0
      until @jump_offsets[index].nil?
        current_index = index
        index += @jump_offsets[index]
        @jump_offsets[current_index] = incr_or_decr_offset(current_index)
        @steps += 1
      end
      @steps
    end

    def incr_or_decr_offset(current_index)
      @jump_offsets[current_index].send(@jump_offsets[current_index] >= 3 ? 'pred' : 'next')
    end
  end
end
