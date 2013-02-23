class HomeController < ApplicationController

  def index
    @timeline = Timeline.order('created_at desc').all
    @ranking = Ranking.includes(:player).order(:position)
  end

end