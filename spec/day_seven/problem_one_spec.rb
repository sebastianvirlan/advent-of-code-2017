# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_seven/problem_one.rb'

RSpec.describe DaySeven::ProblemOne do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    it 'returns the head of the program' do
      @input = File.read(File.join(File.dirname(__FILE__), 'input.txt'))
      expect(subject).to eq('tknk')
    end
  end
end
