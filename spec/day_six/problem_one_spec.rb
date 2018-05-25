# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_six/problem_one.rb'

RSpec.describe DaySix::ProblemOne do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns the number redistribution cycles' do
      @input = '0	2	7	0'
      expect(subject).to eq(5)
    end
  end
end
