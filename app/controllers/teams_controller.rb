class TeamsController < ApplicationController

  def get_new_score_data
    @teams = Team.select([:name, :id, :logo]).collect {| t | {:value => t.id, :label => t.name, :logo => t.logo}}
    
    last_game_player1  = Game.where("player1_id = ? OR player2_id = ?", params[:player1], params[:player1]).last
    if !last_game_player1.nil?
      last_team_player1_id = (last_game_player1.player1_id == params[:player1].to_i)? last_game_player1.player1_team_id : last_game_player1.player2_team_id
      @last_team_player1 = Team.find(last_team_player1_id)
    end

    last_game_player2  = Game.where("player1_id = ? OR player2_id = ?", params[:player2], params[:player2]).last
    if !last_game_player2.nil?
      last_team_player2_id = (last_game_player2.player2_id == params[:player2].to_i)? last_game_player2.player2_team_id : last_game_player2.player1_team_id
      @last_team_player2 = Team.find(last_team_player2_id)
    end
    

    respond_to do |format|
      format.json  { render :json => {:all_teams => @teams, :last_team_player1 => @last_team_player1, :last_team_player2 => @last_team_player2} }
    end
  end
end