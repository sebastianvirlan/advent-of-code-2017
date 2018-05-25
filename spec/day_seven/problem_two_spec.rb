# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_seven/problem_two.rb'

RSpec.describe DaySeven::ProblemTwo do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns the unbalanced program and the correct weight' do
      @input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(subject[:balanced_weight]).to eq(60)
      expect(subject[:program_name]).to eq('ugml')
    end
  end
end
