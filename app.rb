require_relative 'models/leaderboard.rb'
require_relative 'models/team.rb'

FRAMER = '*****************************************'
HEADER = '*   TEAM       RANK     WINS    LOSSES  *'
UNDER  = '*---------------------------------------*'
SEPER  = '*                                       *'

leaderboard = Leaderboard.new
Leaderboard::GAME_INFO.each do |game_results|
  new_team = game_results[:home_team]
  leaderboard.fill_in_teams(new_team)

  new_team = game_results[:away_team]
  leaderboard.fill_in_teams(new_team)
end

leaderboard.teams.each_with_index do |team, index|
  Leaderboard::GAME_INFO.each do |game_result|
    if game_result[:home_team] == team.name
      team_score     = game_result[:home_score]
      opponent_score = game_result[:away_score]

    elsif game_result[:away_team] == team.name
      team_score     = game_result[:away_score]
      opponent_score = game_result[:home_score]
    end
    leaderboard.record_calculator(team, team_score, opponent_score)
  end
end
leaderboard_sorted = leaderboard.teams.sort_by(&:wins).reverse

puts "\n#{FRAMER}\n#{HEADER}\n#{UNDER}"
rank = 1
leaderboard_sorted.each do |team|
  team.rank = rank
  if team.name.size < 8
    extra_spaces = 8 - team.name.size
    extra_spaces.times { team.name << " " }
  end
  puts "* #{team.name.upcase}  --   #{team.rank}   --   #{team.wins}   --   #{team.losses}    *"
  puts SEPER unless team == leaderboard_sorted.last
  rank += 1
end
puts FRAMER

leaderboard.team_summary("Patriots")
leaderboard.team_summary("Broncos")
leaderboard.team_summary("Colts")
leaderboard.team_summary("Steelers")
