# A valid passphrase must contain no two words that are anagrams of each other - that is,
# a passphrase is invalid if any word's letters can be rearranged to form any other word in the passphrase.

# For example:

# abcde fghij is a valid passphrase.
# abcde xyz ecdab is not valid - the letters from the third word can be rearranged to form the first word.
# a ab abc abd abf abj is a valid passphrase, because all letters need to be used when forming another word.
# iiii oiii ooii oooi oooo is valid.
# oiii ioii iioi iiio is not valid - any of these words can be rearranged to form any other word.
# Return the number of valid passphrases

module DayFour
  class ProblemTwo
    def initialize(input)
      @passphrases = input.split(/\n+/).map { |row| row.split(' ').map { |word| word.split('').sort.join } }
    end

    def resolve
      @passphrases.select { |row| row if row.uniq == row }.length
    end
  end
end