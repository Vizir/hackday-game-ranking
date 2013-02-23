class HomeController < ApplicationController

  def index
    @timeline = Timeline.all
    @ranking = Ranking.order(:position)
  end

end