require "set"

class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def add_neighbor(node)
        self.neighbors << node
    end

    def bfs(starting_node, target_value)
        visited = Set.new()
        queue = []
        queue << starting_node
        until queue.empty?
            first_node = queue.shift
            visited.add(first_node)
            return first_node.value if first_node.value == target_value
            first_node.neighbors.each { |node| queue << node if visited.none?(node)}
        end
        nil
    end

end


# a = GraphNode.new('a')
# b = GraphNode.new('b')
# c = GraphNode.new('c')
# d = GraphNode.new('d')
# e = GraphNode.new('e')
# f = GraphNode.new('f')
# a.neighbors = [b, c, e]
# c.neighbors = [b, d]
# e.neighbors = [a]
# f.neighbors = [e]