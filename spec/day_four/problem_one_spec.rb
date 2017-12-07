require 'rspec'
require_relative '../../solutions/day_four/problem_one.rb'

RSpec.describe DayFour::ProblemOne do
  describe '#resolve' do
    subject { described_class.new(@input).resolve }


    it "returns the number of valid unique rows" do
      @input = <<-HEREDOC
      aa bb cc dd ee
      aa bb cc dd aa
      aa bb cc dd aaa
      HEREDOC
      expect(subject).to eq(2)
    end
  end
end