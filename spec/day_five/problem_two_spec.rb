require 'rspec'
require_relative '../../solutions/day_five/problem_two.rb'

RSpec.describe DayFive::ProblemTwo do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }


    it 'returns the number of steps' do
      @input = <<-HEREDOC
      0
      3
      0
      1
      -3
      HEREDOC
      expect(subject).to eq(10)
    end
  end
end