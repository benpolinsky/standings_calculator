# The Standings class is responsible for determining
# how many points to award based on game results
# 
# Standings accepts one parameter, an array of +games+, 
# which needs to respond to a few methods
# 
# Example
# standings = Standings.new(games)
# 
# To print to console:
# standings.to_s
# 
# To print to file:
# standings.print_to_file
#


class Standings

  # @info returns an unsorted hash with teams as keys
  # and their standings points as values
  #
  # example:
  # {team_one: 4, team_two: 5, team_three: 1}
  
  attr_reader :info

  OUTPUT_FILE_NAME = 'output-file.txt'
  POINTS_FOR_TIE = 1
  POINTS_FOR_WIN = 3
  POINTS_FOR_LOSS = 0  # a reminder that 'nothing is something' (Metz)
  
  def initialize(games)
    @games = games
    @info = Hash.new(0)
    determine_standings
  end
  
  # sorts the hash first by highest score, 
  # second alphabetically according to a team's name
  
  def ordered
    @info.sort_by {|k, v| [-v, k]}.to_h
  end

  # Iterates through the ordered hash of standing info (@info)
  # When no block is given, the method simply prints the standings
  # one line at a time.
  
  # When a block is given, the method yields all necessary information
  # to construct standings.  
  def each_info 
    ordered.each do |team_and_score|
      team = team_and_score[0]
      score = team_and_score[1]
      if block_given?
        yield(place(team_and_score), team, score, ending(score))
      else
        p "#{place(team_and_score)} #{team}, #{score} #{ending(score)}"
      end
    end  
  end
  
  # Simply calls #each_info
  def to_s
    each_info
  end
  
  # Utilizes #each_info to print standings to a file
  # Probably rename to #to_file
  def print_to_file
    each_info do |place, team, score, ending|
      write_line "#{place} #{team}, #{score} #{ending}"
    end
  end
  
  private
  
  # Iterates through each game and awards points
  # based on the result.  Populates @info
  
  def determine_standings
    @games.each do |game|
      if game.tie?
        @info[game.team_one_name] += POINTS_FOR_TIE
        @info[game.team_two_name] += POINTS_FOR_TIE
      else
        @info[game.winner] += POINTS_FOR_WIN
        @info[game.loser] += POINTS_FOR_LOSS  # If a team hasn't played to win or tie
      end
    end
  end
  
  # Determine a team's place in standings.
  # Teams that are tied have the same place
  # With the next non-tied team skipping over the 'unused' place
  #
  # An example:
  #
  # 1. Best FC, 10 pts
  # 2. Okay FC, 5 pts
  # 2. Alright FC, 5 pts
  # 4. Wurst FC, 0 pts  
  
  def place(team)
    team_index = ordered.to_a.index(team)
    previous_team = ordered.to_a[team_index-1]
    
    # We store the previous standing in an instance variable
    # so we can reference it if two or more teams are tied in
    # the standings
    
    if team_index > 0 && previous_team[1] == team[1]
      @previous_standing ||= team[0]
      "#{ordered.keys.index(@previous_standing)}."
    else
      @previous_standing = nil
      "#{ordered.keys.index(team[0]) + 1}."
    end
  end
  
  def ending(number)
    number == 1 ? 'pt' : 'pts'
  end
  
  def write_line(text)
    File.open(OUTPUT_FILE_NAME, 'a') do |f|
      f.write text + "\n"
    end
  end
  
end