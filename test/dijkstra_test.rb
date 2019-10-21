require 'test_helper'

class DijkstraTest < ActiveSupport::TestCase
    test "should return distance 5" do
        graph = GraphService.new
        graph.add_edge("a", "b", 5)
        graph.add_edge("b", "d", 3)
        graph.add_edge("b", "c", 7)
        graph.add_edge("d", "e", 10)
        graph.add_edge("c", "e", 4)
        graph.add_edge("d", "f", 8)
        
        assert_equal(5, graph.shortest_path("a", "b"))
    end

    test "should return distance 16" do
        graph = GraphService.new
        graph.add_edge("a", "b", 5)
        graph.add_edge("b", "d", 3)
        graph.add_edge("b", "c", 7)
        graph.add_edge("d", "e", 10)
        graph.add_edge("c", "e", 4)
        graph.add_edge("d", "f", 8)
        
        assert_equal(16, graph.shortest_path("a", "f"))
    end

    test "should return distance 28" do
        graph = GraphService.new
        graph.add_edge("a", "b", 5)
        graph.add_edge("b", "d", 3)
        graph.add_edge("b", "c", 7)
        graph.add_edge("d", "e", 10)
        graph.add_edge("c", "e", 4)
        graph.add_edge("d", "f", 20)
        
        assert_equal(28, graph.shortest_path("a", "f"))
    end
end