Print a styled leaderboard to your CLI based on inputed game results.

The leaderboard Displays:
* Team Name
* Rank
* Number of Wins
* Number of Losses

The `spec` folder features full unit test coverage for the models and `app.rb`.

`Team.rb` constructs an instance of a Team object, with the following attributes:
* Name
* Rank (based on wins)
* Wins (total # of wins)
* Losses (total # of losses)

Game data is supplied in `leaderboard.rb` as a constant called `GAME_INFO`.

`Leaderboard.rb` contain contains a class, which is initialized based on game data, and can hold any display any number of team objects, so that is can display each teams' stats. The leaderboard class contains the following instance methods:
* `fill_in_teams` (finds all unique team names)
* `record_calculator` (calculates wins and losses for each team)

`Leaderboard.rb` also has a method called `team_summary`, which takes a parameter of a team object and prints details of each game that team played.

##Example Output
![Leaderboard_Ouput](http://gdurl.com/rPxq)
![Leaderboard_Ouput](http://gdurl.com/t3dJ)
