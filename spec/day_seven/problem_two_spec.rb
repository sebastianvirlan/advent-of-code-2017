require 'rspec'
require_relative '../../solutions/day_seven/problem_two.rb'

RSpec.describe DaySeven::ProblemTwo do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns the head of the program' do
      @input = File.read('spec/day_seven/input.txt')
      expect(subject[:balanced_weight]).to eq(60)
      expect(subject[:program_name]).to eq('ugml')
    end
  end
end
