require 'minitest/autorun'
require '../standings'

class TestStandings < Minitest::Test
  def setup

    # Todo, mock games.
    games = [
      Game.new("My Fun Team 1, My Other Team 2"),
      Game.new("My Fun Team 3, My Other Team 0"),
      Game.new("My Fun Team 1", "Trying Team 0"),
      Game.new("Trying Team 0", "Another Team 1"),     
    ]
    
    @standings = Standings.new(games)
  end
  
  def test_info
    expect(@standings.info).to eq {
      
    }

  end
  
  def test_ordered
  end
  
  def test_output
  end
  
  def test_to_s_with_no_block
  end
  
  # not sure if this makes sense...
  def test_to_s_with_block
  end
  
  def test_print_to_file
  end
  
end