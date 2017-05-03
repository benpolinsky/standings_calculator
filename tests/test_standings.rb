require 'minitest/autorun'
require '../standings'

class TestStandings < Minitest::Test
  def setup
    @standings = Standings.new([])
  end
  
  def test_info

  end
  
  def test_ordered
  end
  
  def test_to_s_with_no_block
  end
  
  # not sure if this makes sense...
  def test_to_s_with_block
  end
  
  def test_print_to_file
  end
end