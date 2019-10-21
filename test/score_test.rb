require 'test_helper'

class ScoreTest < ActiveSupport::TestCase
    test "should return score 100" do
        score = ScoreService.new
        assert_equal(100, score.calculate_score(100, 100))
    end

    test "should return score 75" do
        score = ScoreService.new
        assert_equal(75, score.calculate_score(100, 50))
    end

    test "should return score 0" do
        score = ScoreService.new
        assert_equal(0, score.calculate_score(0, 0))
    end

    test "should return level 100" do
        score = ScoreService.new
        assert_equal(100, score.calculate_level(10, 10))
    end

    test "should return level 75" do
        score = ScoreService.new
        assert_equal(75, score.calculate_level(10, 9))
    end

    test "should return level 0" do
        score = ScoreService.new
        assert_equal(0, score.calculate_level(10, 6))
    end

    test "should return distance 100" do
        score = ScoreService.new
        assert_equal(100, score.calculate_distance("a", "b"))
    end

    test "should return distance 25" do
        score = ScoreService.new
        assert_equal(25, score.calculate_distance("a", "f"))
    end
end