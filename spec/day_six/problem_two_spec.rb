# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_six/problem_two.rb'

RSpec.describe DaySix::ProblemTwo do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns the number redistribution cycles' do
      @input = '0	2	7	0'
      expect(subject).to eq(4)
    end
  end
end
