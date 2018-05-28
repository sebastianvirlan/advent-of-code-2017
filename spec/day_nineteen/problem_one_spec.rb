# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_nineteen/problem_one.rb'

RSpec.describe DayNineteen::ProblemOne do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns the characters found in matrix' do
      @input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(subject).to eq('DWNBGECOMY')
    end
  end
end
