# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_four/problem_two.rb'

RSpec.describe DayFour::ProblemTwo do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns the number of valid rows that contain no two words that are anagrams' do
      @input = <<-HEREDOC
      abcde fghij
      abcde xyz ecdab
      a ab abc abd abf abj
      iiii oiii ooii oooi oooo
      oiii ioii iioi iiio
      HEREDOC
      expect(subject).to eq(3)
    end
  end
end
