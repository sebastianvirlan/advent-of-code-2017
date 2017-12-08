# Find the size of the loop: starting from a state that has already been seen, how many block redistribution cycles
# must be performed before that same state is seen again?
# Return the number of cycles in the infinite loop

require_relative 'problem_one'

module DaySix
  class ProblemTwo
    def initialize(input)
      @problem_one = ProblemOne.new(input)
      @problem_one.resolve
    end

    def resolve
      @problem_one.patterns.length - @problem_one.patterns.index(@problem_one.input)
    end
  end
end

