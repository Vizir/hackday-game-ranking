class ProfilesController < ApplicationController

  def index
    
  end

  def show_profile
    @player_name = params[:player_name]
    @p = Player.where(:username => @player_name)
  end
end
