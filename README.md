##Leaderboard

Prints a styled leaderboard to your CLI based on inputed game results.

The `spec` folder features full unit test coverage for the models and `app.rb`.

`team.rb` constructs an instance of a Team object, with the following attributes:
* Team Name
* Rank
* Number of Wins
* Number of Losses

Game data is supplied in `leaderboard.rb` as a constant called `GAME_INFO`.

`leaderboard.rb` contain contains a class, which is initialized based on game data, and can hold any display any number of team objects, so that is can display each teams' stats. The leaderboard class contains the following instance methods:
* `fill_in_teams` (finds all unique team names)
* `record_calculator` (calculates wins and losses for each team)
* `team_summary` (outputs details of each game a team played)

###Sample Output
![Leaderboard_Ouput](http://gdurl.com/rPxq)
![Leaderboard_Ouput](http://gdurl.com/t3dJ)
