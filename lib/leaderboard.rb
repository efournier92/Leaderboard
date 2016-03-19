class Leaderboard
FRAMER = '*****************************************'
SEP    = '-----------------------------------------'
GAME_INFO = [
    {
      home_team: "Patriots",
      away_team: "Broncos",
      home_score: 17,
      away_score: 13
    },
    {
      home_team: "Broncos",
      away_team: "Colts",
      home_score: 24,
      away_score: 7
    },
    {
      home_team: "Patriots",
      away_team: "Colts",
      home_score: 21,
      away_score: 17
    },
    {
      home_team: "Broncos",
      away_team: "Steelers",
      home_score: 11,
      away_score: 27
    },
    {
      home_team: "Steelers",
      away_team: "Patriots",
      home_score: 24,
      away_score: 31
    }
]

  attr_accessor :teams

  def initialize
    @teams = []
  end

  def fill_in_teams(new_team)
    team = @teams.find { |team| team.name == new_team }
    if team.nil?
      team = Team.new(new_team)
      @teams << team
    end
    @teams
  end

  def record_calculator(team, team_score, opponent_score)
    unless team_score.nil?
      if team_score > opponent_score
        team.wins += 1
      else
        team.losses += 1
      end
    end
  end

  def team_summary(sum_team)
    puts "\n#{sum_team.upcase} STATS"
    puts "#{FRAMER}"
      points_scored             = 0
      points_scored_at_home     = 0
      points_scored_away        = 0
      points_scored_by_opponent = 0
      games_played              = 0
    Leaderboard::GAME_INFO.each do |game_results|
      if game_results[:home_team] == sum_team
        team = game_results[:home_team]
        opponent = game_results[:away_team]
        points_scored += game_results[:home_score]
        points_scored_by_opponent += game_results[:away_score]
        points_scored_at_home += game_results[:home_score]
        games_played += 1
        puts "The #{game_results[:home_team].to_s.strip} played The #{game_results[:away_team].to_s.strip} at home."
        puts "The score was #{game_results[:home_score]} to #{game_results[:away_score]}."
        puts FRAMER
      elsif game_results[:away_team] == sum_team
        team = game_results[:away_team]
        opponent = game_results[:home_team]
        points_scored += game_results[:away_score]
        points_scored_by_opponent += game_results[:home_score]
        points_scored_away += game_results[:away_score]
        games_played += 1
        puts "The #{game_results[:away_team].to_s.strip} played The #{game_results[:home_team].to_s.strip} away."
        puts "The score was #{game_results[:home_score]} to #{game_results[:away_score]}."
        puts FRAMER
      end
    end
    puts "Games Played:    #{games_played}"
    puts SEP
    puts "Points Scored:   #{points_scored}"
    puts "Points Given Up: #{points_scored_by_opponent}"
    puts SEP
    puts "Points Scored at Home: #{points_scored_at_home}"
    puts "Points Scored Away:    #{points_scored_away}"
    puts FRAMER
  end
end
