#TRANSFORMATIONS = [8, 12, 19, 21]

# def procreate(parent_move)
#   position_as_int = parent_move.position.join('').to_i
#   children =
#     TRANSFORMATIONS.reduce([]) do |new_moves, transformation|
#       new_moves << position_as_int + transformation
#       new_moves << position_as_int - transformation
#     end
#   parent_move.children = children.map { |child| child.to_s.split('').map(&:to_i) }
#                                  .reject { |child| child.length < 2 }
#                                  .keep_if { |position| Move.valid?(position) }
#                                  .reject { |position| parent_move.history.include?(position) }
#                                  .map { |position| Move.new(position, parent_move.history) }
# end
  





# def knight_moves(start_pos, end_pos)
#   step(current_generation = start_pos)
# end

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
                   .keep_if { |e| valid?(e) }
                   .map { |e| MoveNode.new(e, self) }
  end

  def valid?(position)
    position[0].between?(1, 8) && position[1].between?(1, 8)
  end
end

new = MoveNode.new([0, 0], nil)
p new.children

# for current generation take each position
# calculate the 8 positions it can go to from there
# eliminate a position if it is not valid
# eliminate a position if it has been visited
# create moves for the positions still left
# line order search, for end_pos

# array = gets.chomp.split.map(&:to_i)
# p array

# spaces_visited
# move_map
# array of all the spots on the board
# for each coordinate, calculate it <= 8 pointers
# after the array is netted up, I just need to implement a breadth first search with a queue.


# level order code from binary search tree
# def level_order(queue = [], node_list = [], current_node = @root)
#   return nil if queue.empty? && current_node.nil?

#   unless current_node.nil?
#     queue.push(current_node.left).push(current_node.right)
#     node_list.push(current_node.value)
#   end
#   current_node = queue.shift
#   level_order(queue, node_list, current_node)
#   node_list
# end