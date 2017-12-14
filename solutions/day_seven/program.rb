class Program
  attr_reader :name, :weight, :children

  def initialize(args = {})
    @name     = args[:name]
    @weight   = args[:value]
    @children = []
  end

  def add_children(program)
    @children << program
  end

  def unbalanced_tree_program
    throw 'Program already balanced' if children_balanced?

    self.class.find_first_unbalanced_child(self)
  end

  def children_weight_map
    @children_weight_map ||= @children.map { |child| child.weight + self.class.recursive_weight(child) }
  end

  def total_weight
    weight + self.class.recursive_weight(self)
  end

  def children_balanced?
    children_weight_map.uniq.length == 1
  end

  def children_unbalanced?
    !children_balanced?
  end

  def unbalanced_child
    @unbalanced_child ||= children.reject { |child| child.total_weight == children_correct_balance }.first
  end

  def balanced_weight
    unbalanced_child.weight - (unbalanced_child.total_weight - children_correct_balance)
  end

  def children_correct_balance
    @correct_balance ||= children.detect { |child| children_count_by_total_weight(child.total_weight) > 1 }.total_weight
  end

  def self.recursive_weight(program, weight = 0)
    weight + program.children.map { |c| recursive_weight(c, c.weight) }.sum
  end

  def self.find_first_unbalanced_child(program)
    unbalanced_child = program.unbalanced_child

    return find_first_unbalanced_child(unbalanced_child.unbalanced_child) if unbalanced_child.children_unbalanced?

    { program_name: unbalanced_child.name, weight: unbalanced_child.weight,  balanced_weight: program.balanced_weight }
  end

  private

  def children_count_by_total_weight(total_weight)
    children.count { |child| child.total_weight == total_weight }
  end
end
