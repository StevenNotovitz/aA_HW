require 'set'

class GraphNode

    attr_accessor = :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def add_neighbor(neighbor)
        neighbors << node
    end

end

def bfs(starting_node, target_value)
    queue = [starting_node]
    visited = Set.new()
    until queue.empty?
        first = queue.shift
        unless visited.include?(node)
            return first.val if first.value == target_value
            visited.add(first)
            queue += first.neighbors
        end
    end
    nil
end