class HomeController < ApplicationController

  def index
    @timeline = Timeline.all
    @ranking = Ranking.limit(10).order(:position)
  end

end