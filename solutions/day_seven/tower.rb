# frozen_string_literal: true

require_relative('program.rb')

class Tower
  def initialize(programs)
    @programs_map = programs
    @tower        = Program.new(name: head, value: @programs_map[head][:val])
    build_tree(@tower)
  end

  def wrong_balance_program
    @tower.unbalanced_tree_program
  end

  def head
    @head ||= begin
      programs = @programs_map.map(&:first)
      children = @programs_map.map { |program| program[1][:children] }.flatten
      (programs - children).first
    end
  end

  private

  def build_tree(head)
    children = @programs_map[head.name][:children]
    children.each do |c|
      child = Program.new(name: c, value: @programs_map[c][:val])
      head.add_children(child)
      build_tree(child)
    end
  end
end
