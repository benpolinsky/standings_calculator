require_relative 'standings'
require_relative 'game'

# quirks
# obviously ties
# obv teams with spaces
# two/three digit scores
# teams with digits?
# THREE or more teams tied

#  Start 2:14
# End task at 3:14 - no specs though, and no standings in ties
# end with ties at 4:15 (considering breaks)

# 1. We need to format the input for parsing
# 2. Create a hash to store standings, something like this:

# standings = {
#   team_name: points,
#   another_team: points
# }

# 3. Sort the hash by the team name, which is the hash's keys
# 4. Iterate through the hash and print the results to the proper format
# 5. ALSO, you can't just print the number, because if people are tied,
# you need to print the sampe

# To run, from command line:
# calculate_standings inputfile.txt
# maybe add an option to name the output file
# calculate_standings --outfile OUTFILE /-o  standings.txt


args = ARGV

if args.any?
  # input_file = ARGF
  # standings = StandingsCalculator.new(input_file)
  # standings.to_s
  input_file = ARGF
  games = input_file.map do |line|
    text = line.chomp
    Game.new(line)
  end
  standings = Standings.new(games)
  standings.print_to_file
end
