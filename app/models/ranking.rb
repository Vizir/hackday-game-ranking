class Ranking < ActiveRecord::Base
  
  belongs_to :league
  belongs_to :player
  attr_accessible :position, :player, :league, :row

  after_create :create_timeline

  private

  def create_timeline
    Timeline.create_message_based_on_ranking(self)
  end

end