# frozen_string_literal: true

# A valid passphrase must contain no duplicate words.

# For example:

# aa bb cc dd ee is valid.
# aa bb cc dd aa is not valid - the word aa appears more than once.
# aa bb cc dd aaa is valid - aa and aaa count as different words.
# The system's full passphrase list is available as your puzzle input.
# Return the number of valid passphrases

module DayFour
  class ProblemOne
    def initialize(input)
      @passphrases = input.split(/\n+/).map { |row| row.split(' ') }
    end

    def resolve
      @passphrases.select { |row| row if row.uniq == row }.length
    end
  end
end
