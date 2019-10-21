class GraphService
	def initialize
		@graph = {}
		@nodes = Array.new
		@INFINITY = 1 << 64
	end
		
	def add_edge(source, target, weight)
		if (not @graph.has_key?(source))
			@graph[source] = {target => weight}
		else
			@graph[source][target] = weight
		end
		
		if (not @graph.has_key?(target))
			@graph[target] = {source => weight}
		else
			@graph[target][source] = weight
		end

		if (not @nodes.include?(source))	
			@nodes << source
		end
		if (not @nodes.include?(target))
			@nodes << target
		end
	end
	
	def dijkstra(source)
		@node_distances = {}
		@prev = {}

		@nodes.each do |node|
			@node_distances[node] = @INFINITY
			@prev[node] = -1
		end

		@node_distances[source] = 0
		compact_nodes = @nodes.compact

		while (compact_nodes.size > 0)
			shortest_node = nil;
			
			compact_nodes.each do |node|
				if (not shortest_node) or (@node_distances[node] and @node_distances[node] < @node_distances[shortest_node])
					shortest_node = node
				end
			end

			if (@node_distances[shortest_node] == @INFINITY)
				break
			end

			compact_nodes = compact_nodes - [shortest_node]
			@graph[shortest_node].keys.each do |node|
				distance = @node_distances[shortest_node] + @graph[shortest_node][node]
				if (distance < @node_distances[node])
					@node_distances[node] = distance
					@prev[node] = shortest_node
				end
			end
		end
	end
	
	def shortest_path(source, target)
		@source = source
		dijkstra source

		if @node_distances[target] == @INFINITY
			return 0
		end

		return @node_distances[target]
	end
end
