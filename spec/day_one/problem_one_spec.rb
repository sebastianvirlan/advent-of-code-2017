require 'rspec'
require_relative '../../solutions/day_one/problem_one.rb'

RSpec.describe DayOne::ProblemOne do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }

    [
      ['1122', 3], ['1111', 4], ['1234', 0], ['91212129', 9]
    ].each do |input, sum|
      it "returns correctly for #{input}" do
        @input = input
        expect(subject).to eq(sum)
      end
    end
  end
end