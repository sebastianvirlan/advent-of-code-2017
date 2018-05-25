# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_two/problem_one.rb'

RSpec.describe DayTwo::ProblemOne do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns correctly for' do
      @input = <<-HEREDOC
      5 1 9 5
      7 5 3
      2 4 6 8
      HEREDOC
      expect(subject).to eq(18)
    end
  end
end
