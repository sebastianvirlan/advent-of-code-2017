# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_eight/problem_two.rb'

RSpec.describe DayEight::ProblemTwo do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns the highest value held' do
      @input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(subject).to eq(10)
    end
  end
end
