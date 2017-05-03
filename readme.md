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
Like so:


