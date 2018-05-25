# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_eight/problem_one.rb'

RSpec.describe DayEight::ProblemOne do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns the max variable value' do
      @input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(subject).to eq(1)
    end
  end
end
