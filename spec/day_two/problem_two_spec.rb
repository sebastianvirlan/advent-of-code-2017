require 'rspec'
require_relative '../../solutions/day_two/problem_two.rb'

RSpec.describe DayTwo::ProblemTwo do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns correctly for' do
      @input = <<-HEREDOC
      5 9 2 8
      9 4 7 3
      3 8 6 5
      HEREDOC
      expect(subject).to eq(9)
    end
  end
end