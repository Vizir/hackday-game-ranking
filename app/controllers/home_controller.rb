class HomeController < ApplicationController

  def index
    @timeline = Timeline.all
  end

end