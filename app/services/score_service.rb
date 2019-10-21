class ScoreService
    def initialize
        @distances = {}

        add_distance_range(0, 5, 100)
        add_distance_range(5, 10, 75)
        add_distance_range(10, 15, 50)
        add_distance_range(15, 20, 25)
    end

    def calculate_level(job_level, person_level)
        return 100 - 25 * (job_level - person_level)
    end

    def calculate_distance(source, target)
        graph = GraphService.new
        graph.add_edge("a", "b", 5)
        graph.add_edge("b", "d", 3)
        graph.add_edge("b", "c", 7)
        graph.add_edge("d", "e", 10)
        graph.add_edge("c", "e", 4)
        graph.add_edge("d", "f", 8)
        
        distance = graph.shortest_path(source.downcase, target.downcase)

        if (!@distances.include? distance)
            return 0
        end

        return @distances[distance]
    end

    def calculate_score(level, distance)
        return (level + distance) / 2
    end

    def add_distance_range(min, max, final)
        for count in min..max do
            if (not @distances[count])
                @distances[count] = final
            end
        end
    end
end
