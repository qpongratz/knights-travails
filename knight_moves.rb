# frozen_string_literal: true

# Controls what move nodes keep track of.
class MoveNode
  attr_reader :position, :parent

  TRANSFORMATIONS = [[1, 2], [-2, -1], [-1, 2], [2, -1],
                     [1, -2], [-2, 1], [-1, -2], [2, 1]].freeze

  def initialize(position, parent)
    @position = position
    @parent = parent
  end

  def children
    TRANSFORMATIONS.map { |t| [@position[0] + t[0], @position[1] + t[1]] }
                   .keep_if { |e| MoveNode.valid?(e) }
                   .map { |e| MoveNode.new(e, self) }
  end

  def self.valid?(position)
    position[0].between?(1, 8) && position[1].between?(1, 8)
  end
end

def display_parent(node)
  display_parent(node.parent) unless node.parent.nil?
  p node.position
end

def knight_moves(start_pos, end_position)
  queue = []
  current_node = MoveNode.new(start_pos, nil)
  until current_node.position == end_position
    current_node.children.each { |child| queue.push(child) }
    current_node = queue.shift
  end
  display_parent(current_node)
end

knight_moves([1, 1], [8, 8])
