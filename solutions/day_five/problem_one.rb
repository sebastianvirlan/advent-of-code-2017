# Consider a list of the offsets for each jump. Jumps are relative: -1 moves to the previous instruction, and 2 skips
# the next one. Start at the first instruction in the list. The goal is to follow the jumps until one leads outside
# the list.

# In addition, these instructions are a little strange; after each jump, the offset of that instruction increases by 1.
# So, if you come across an offset of 3, you would move three instructions forward, but change it to a 4 for the next
# time it is encountered.

# For example, consider the following list of jump offsets:
#
# 0
# 3
# 0
# 1
# -3

# Positive jumps ("forward") move downward; negative jumps move upward. For legibility in this example, these offset
# values will be written all on one line, with the current instruction marked in parentheses. The following steps would
# be taken before an exit is found:
# (0) 3  0  1  -3  - before we have taken any steps.
# (1) 3  0  1  -3  - jump with offset 0 (that is, don't jump at all). The instruction is incremented to 1.
#  2 (3) 0  1  -3  - step forward because of the instruction we just modified. First instruction is incremented to 2.
#  2  4  0  1 (-3) - jump all the way to the end; leave a 4 behind.
#  2 (4) 0  1  -2  - go back to where we just were; increment -3 to -2.
#  2  5  0  1  -2  - jump 4 steps forward, escaping the maze.
# In this example, the exit is reached in 5 steps.
# Return the number of steps

module DayFive
  class ProblemOne
    def initialize(input)
      @jump_offsets = input.split(/\n+/).map(&:to_i)
      @steps = 0
    end

    def resolve
      index = 0
      until @jump_offsets[index].nil?
        current_index = index
        index += @jump_offsets[index]
        @jump_offsets[current_index] += 1
        @steps += 1
      end
      @steps
    end
  end
end