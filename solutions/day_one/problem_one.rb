# frozen_string_literal: true

# Review a sequence of digits and find the sum of all digits that match the next digit in the list.
# The list is circular, so the digit after the last digit is the first digit in the list.

# For example:

# 1122 produces a sum of 3 (1 + 2) because the first digit (1) matches the second digit and the third digit (2) matches
# the fourth digit.
# 1111 produces 4 because each digit (all 1) matches the next.
# 1234 produces 0 because no digit matches the next.
# 91212129 produces 9 because the only digit that matches the next one is the last digit, 9.

module DayOne
  class ProblemOne
    def initialize(input)
      @numbers  = input.split('').map(&:to_i)
      @matches  = []
    end

    def resolve
      @numbers.each_cons(2) { |a, b| @matches.push(a) if a == b }
      @matches.push(@numbers.last) if @numbers.last == @numbers.first
      @matches.sum
    end
  end
end
