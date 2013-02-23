class GamesController < ApplicationController

  def create
    @game = Game.new(params[:game])
    @game.player1_id = current_player.id
    @game.save
    
    respond_to do |format|
      format.js
    end
  end

end