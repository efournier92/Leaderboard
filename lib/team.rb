class Team
  attr_accessor :name, :rank, :wins, :losses
  def initialize(team_name)
    @name = team_name
    @rank = nil
    @wins = 0
    @losses = 0
  end
end
