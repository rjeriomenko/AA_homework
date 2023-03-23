class GraphNode
    attr_accessor :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(arr)
        @neighbors = arr
    end
    
    def pn
        p "-----------"
        p value
        neighbors.each { |neighbor| p "IM A NEIGHBOR"; p neighbor }
        p "-----------"
    end

    def bfs(target_value)
        nodes_searched = 0
        return [self, nodes_searched] if self.value == target_value

        visited = Set.new()
        queue = neighbors.clone
        
        
        while queue.length > 0
            next_node = queue.shift

            visited.include?(next_node) ? next : visited.add(next_node)
            nodes_searched += 1
            return [next_node, nodes_searched] if next_node.value == target_value
            queue.concat(next_node.neighbors)
        end

        nil
    end





end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

a.pn
b.pn
c.pn
d.pn
e.pn
f.pn
p "---------TARGET SEARCHING BEGINS HERE-----------"
p f.bfs("e")
p a.bfs("f")
p a.bfs("d")