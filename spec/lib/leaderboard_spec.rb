require_relative 'team_spec.rb'
require 'spec_helper'
require 'pry'

RSpec.describe Leaderboard do
  describe '.new' do
    leaderboard = Leaderboard.new
    it 'has an array for teams' do
      expect(leaderboard.teams).to eq([])
    end
  end

  describe '#fill_in_teams' do
    leaderboard = Leaderboard.new
    it 'should add a team object for each unique team' do
      expect(leaderboard.fill_in_teams("Patriots").count).to eq(1)
    end
  end

  describe '#record_calculator' do
    leaderboard = Leaderboard.new
    leaderboard.teams << Team.new("Patriots")
    it 'should keep track of wins' do
      team_score = 21
      opponent_score = 17
      leaderboard.record_calculator(leaderboard.teams[0], team_score, opponent_score)
      expect(leaderboard.teams[0].wins).to eq(1)
    end
    team_score = 17
    opponent_score = 18
    it 'should keep track of losses' do
      leaderboard.record_calculator(leaderboard.teams[0], team_score, opponent_score)
      expect(leaderboard.teams[0].losses).to eq(1)
    end
  end
end
