class GamesController < ApplicationController

  def create
    @game = Game.new(params[:game])
    @game.player1_id = current_player.id
    @game.save
    
    redirect_to root_path
  end

end