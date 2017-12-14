# Being the following list
#
# pbga (66)
# xhth (57)
# ebii (61)
# havc (66)
# ktlj (57)
# fwft (72) -> ktlj, cntj, xhth
# qoyq (66)
# padx (45) -> pbga, havc, qoyq
# tknk (41) -> ugml, padx, fwft
# jptl (61)
# ugml (68) -> gyxo, ebii, jptl
# gyxo (61)
# cntj (57)
#
# You would be able to recreate the structure of the towers that looks like this:
#                  gyxo
#                 /
#           ugml  - ebii
#         /       \
#        |         jptl
#        |
#        |         pbga
#      /          /
# tknk ---  padx - havc
#      \          \
#        \         qoyq
#        |
#        |         ktlj
#         \       /
#           fwft - cntj
#                 \
#                 xhth
#
# In this example, tknk is at the bottom of the tower (the bottom program), and is holding up ugml, padx, and fwft.
# Those programs are, in turn, holding up other programs; in this example, none of those programs are holding up any
# other programs, and are all the tops of their own towers. (The actual tower balancing in front of you is much larger.)
#
# Input: http://adventofcode.com/2017/day/7/input
# What is the name of the bottom program?

require_relative('base.rb')
require_relative('tower.rb')

module DaySeven
  class ProblemOne < Base
    def initialize(input)
      @input = input
    end

    def resolve
      Tower.new(input_map).head
    end
  end
end
