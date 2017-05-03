require 'optparse'
require_relative 'standings'
require_relative 'game'

# To run, from command line:
# ruby calculate_standings.rb inputfile.txt

OptionParser.new do |parser|
  # Add banner
  parser.banner = "A command-line utility for determing soccer standings.\n"
  parser.banner += "Usage: ruby standings_calculator.rb INPUT_FILE" 
   
  # Summary when help requested
  parser.on("-h", "--help", "Shows this help message...") do
    puts parser
  end
  
end.parse!

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
  standings.to_s
end
