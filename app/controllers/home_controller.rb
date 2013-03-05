class HomeController < ApplicationController

  def index
    if current_player.nil?
      league = League.first #Definir uma liga Default 
    else
      league = current_player.leagues.first
    end
    @ranking = Ranking.where(:league_id => league).order(:position)
    @timeline = Timeline.where(:league_id => league).order('created_at desc')
  end

  def show_timeline_item
    index
    @timeline = [Timeline.find(params[:id])]
    render "timeline"
  end

end