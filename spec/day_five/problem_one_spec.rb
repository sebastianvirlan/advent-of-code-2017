require 'rspec'
require_relative '../../solutions/day_five/problem_one.rb'

RSpec.describe DayFive::ProblemOne do
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
      expect(subject).to eq(5)
    end
  end
end