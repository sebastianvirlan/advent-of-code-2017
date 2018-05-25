# frozen_string_literal: true

require 'rspec'
require_relative '../../solutions/day_one/problem_two.rb'

RSpec.describe DayOne::ProblemTwo do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    [
      ['1212', 6], ['1221', 0], ['123425', 4], ['123123', 12], ['12131415', 4]
    ].each do |input, sum|
      it "returns correctly for #{input}" do
        @input = input
        expect(subject).to eq(sum)
      end
    end
  end
end
