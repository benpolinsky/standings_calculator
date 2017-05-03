require 'minitest/autorun'
require_relative '../game.rb'
require_relative '../standings'

class TestStandings < Minitest::Test
  def setup

    # TODO: mock games.
    games = [
      Game.new("My Fun Team 1, My Other Team 2"),
      Game.new("My Fun Team 3, My Other Team 0"),
      Game.new("My Fun Team 1, Trying Team 0"),
      Game.new("Trying Team 0, Another Team 1"),     
    ]
    
    @standings = Standings.new(games)
  end
  
  def test_info
    expected_hash = {
      "My Fun Team" => 6,
      "My Other Team" => 3,
      "Trying Team" => 0,
      "Another Team" => 3 
    }
    
    assert_equal(expected_hash, @standings.info)
  end
  
  def test_ordered
    ordered_hash = {
      "My Fun Team" => 6,
      "Another Team" => 3, 
      "My Other Team" => 3,
      "Trying Team" => 0
    }
    
    assert_equal(ordered_hash, @standings.ordered)
  end
  
  
  def test_output
  end
  
  # So, this seems a bit clunky.
  # I should have the output be returned to be printed rather than
  # printing from within the method
  def test_to_s_with_no_block
    expected_output = ["\"1. My Fun Team, 6 pts\"\n\"2. Another Team, 3 pts\"\n\"2. My Other Team, 3 pts\"\n\"4. Trying Team, 0 pts\"\n", ""]
    out = capture_io do
      @standings.to_s
    end
    assert_equal(expected_output, out)
  end
  
  # not sure if this makes sense...
  def test_to_s_with_block
  end
  
  def test_print_to_file
  end
  
end