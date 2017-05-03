# accepts a recap of a game formatted like so:
# "Team One score, Team Two score"
class Game
  # initially I was just score[-1].to_i
  TEAM_SCORE_REGEX = /(.+)( \d*)/
  
  attr_accessor :team_one, :team_two
  
  def initialize(recap)
    @recap_array = prepare(recap)
    @team_one = @recap_array[0]
    @team_two = @recap_array[1]
  end
  
  def team_one_name
    @team_one[0]
  end
  
  def team_two_name
    @team_two[0]
  end
  
  def winner
    # Enumerable#max_by returns the maximum value 
    # as specified by the block.  
    #
    # We use our score, stored in the second element
    # of @recap_array, and then grab the name of the
    # team stored in @recap_array[0]
    
    # unless it's a tie, of course
    @winner ||= @recap_array.max_by{|a| a[1]}[0] unless tie?
  end
  
  def loser
    @loser ||= @recap_array.min_by{|a| a[1]}[0] unless tie?
  end
  
  def tie?
    @recap_array[0][1] - @recap_array[1][1] == 0
  end  
  
  private
  
  # transform our recap string to a 2x2 array:
  # [[Union FC, 10], [Galaxy, 1]]

  def prepare(recap)
    recap.split(", ").map do |team|
      [TEAM_SCORE_REGEX.match(team)[1], TEAM_SCORE_REGEX.match(team)[2].to_i]
    end
  end
  
end
