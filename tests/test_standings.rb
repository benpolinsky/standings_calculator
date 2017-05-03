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
  
  # So, this seems a bit clunky.
  # I should have the output returned to be printed rather than
  # printing from within the method
  #
  # It's because you tried to get clever with #each_info
  # accepting a block :)
  
  def test_to_s_with_no_block
    expected_output = ["\"1. My Fun Team, 6 pts\"\n\"2. Another Team, 3 pts\"\n\"2. My Other Team, 3 pts\"\n\"4. Trying Team, 0 pts\"\n", ""]
    out = capture_io do
      @standings.to_s
    end

    assert_equal(expected_output, out)
  end

  # should mock file, or at least mock the constant that sets the file name
  def test_print_to_file
    File.delete('output-file.txt') if File.exists?('output-file.txt')
    assert_equal(File.exists?('output-file.txt'), false)
    @standings.print_to_file
    assert_equal(File.exists?('output-file.txt'), true)
  end
  
  def test_print_correct_standings_to_file
    output = 
    "1. My Fun Team, 6 pts
2. Another Team, 3 pts
2. My Other Team, 3 pts
4. Trying Team, 0 pts
"
    File.delete('output-file.txt') if File.exists?('output-file.txt')
    @standings.print_to_file
    assert_equal(File.read('output-file.txt'), output)
  end

  # TODO: test or get rid of your block craziness :)
  def test_to_s_with_block
  end
  
  
  
  
end