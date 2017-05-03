require 'minitest/autorun'
require_relative '../game.rb'

class TestGame < Minitest::Test
  def setup
    @game = Game.new("My Fun Team 1, My Other Team 2")
  end
  
  def test_team_one
    assert_equal(["My Fun Team", 1], @game.team_one)
  end
    
  def test_team_one_name
    assert_equal("My Fun Team", @game.team_one_name)
  end
  
  def test_team_two
    assert_equal(["My Other Team", 2], @game.team_two)
  end
  
  def test_team_one_name
    assert_equal("My Other Team", @game.team_two_name)
  end
  
  def test_winner_team_two
    assert_equal("My Other Team", @game.winner)
  end
  
  def test_loser_team_one
    assert_equal("My Fun Team", @game.loser)
  end
  
  def test_winner_team_one
    game = Game.new("Sixers FC 10, Lakers 2")
    assert_equal("Sixers FC", game.winner)
  end
  
  def test_loser_team_two
    game = Game.new("Sixers FC 10, Lakers 2")
    assert_equal("Lakers", game.loser)
  end
  
  def test_tie
    game = Game.new("Even 1, Steven 1")
    assert_equal(true, game.tie?)
  end
  
  def test_tied_at_zero
    game = Game.new("Even 0, Steven 0")
    assert_equal(true, game.tie?)
  end
  
  def test_tied_at_100
    game = Game.new("Even 100, Steven 100")
    assert_equal(true, game.tie?)
  end
  
  def test_tied_when_not_tied
    game = Game.new("Even 101, Steven 100")
    assert_equal(false, game.tie?)
  end
  
  def test_team_with_number
    game = Game.new("Best Number 1 9, The Number 9 10")
    assert_equal(game.team_one_name, "Best Number 1")
    assert_equal(game.team_two_name, "The Number 9")
  end
  
  
end