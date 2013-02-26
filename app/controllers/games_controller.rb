class GamesController < ApplicationController

  before_filter :authenticate_player!

  def create
    @game = Game.new(params[:game])
    @game.player1_id = current_player.id
    @game.save
    
    redirect_to root_path
  end

end