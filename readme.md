# Standings Calculator

## Description
Standings Calculatior is a Command-Line tool that determines 
the standings of teams based a list of properly formatted game results.

### Usage: 

```
% ruby standings_calulator.rb games-input.txt
```

Where ```games-input.txt``` is a simple textfile containing the results of one game per line, formatted like so:

```
Manchester United 1, Philadelphia Union 6
```

With each team followed by a space followed by goals scored, separated by a comma (and one space).


### Output:

The Standings Calculator will print to a file named ```output-file.txt``` in the project's root directory.
TODO: Add command line option for specifying file/path.
The output is formatted as follows:

```
1. Tarantulas, 6 pts
2. Lions, 5 pts
3. FC Awesome, 1 pt
3. Snakes, 1 pt
5. Grouches, 0 pts

```

With each team ranked according to total points, calculated as:
- 3 points for a win
- 1 point for a tie
- 0 points for a loss


## Use of Standings class directly

It's also perfectly fine to use the ```Standings``` class independent of the command-line tool.
Standings accepts one parameter, an array of +games+, 
which only needs to respond to a few methods (see Game.rb)
Example: 

```
game = Game.new("USA 1, Canada 0")
game_two = Game.new("Brazil 4, Germany 1")
game_three = Game.new("USA 3, Italy 3")

games = [game, game_two, game_three]

standings = Standings.new(games)

# To print to console:
standings.to_s

# To print to file:
standings.print_to_file
```

Standings#to_s also accepts a block which yields necessary information to build each standing line:
Place = ranking in standings
Team = Team Name
Score = Team Score in Standings
Ending = Pluralize or singular 'pt'

```
standings.to_s do |place, team, score, ending|
  # maybe you want the standings score first?
end
```


## Tests

All tests are in the /tests directory, written in Minitest. 
Run them in the usual manner:
```
ruby tests/*
```
