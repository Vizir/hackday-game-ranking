class CommentsController < ApplicationController

  before_filter :authenticate_player!

  respond_to :json

  def create
    comment = Timeline.find(params[:timeline_id]).comments.new params[:comment]
    comment.user_id = current_player.id
    comment.save
    redirect_to root_url
  end

end