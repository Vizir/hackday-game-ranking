class HomeController < ApplicationController

  def index
    @timeline = Timeline.all
    @ranking = Ranking.includes(:player).order(:position)
  end

end