class Ranking < ActiveRecord::Base
  
  belongs_to :league
  belongs_to :player
  attr_accessible :position, :player, :league

  def row
    ((-1.0 + Math.sqrt(1.0 + 8.0 * self.position)) / 2.0).ceil
  end

  def self::valid_for_ranking?(player_1, player_2)
    row_player_1 = Ranking.where(player_id: player_1).first.row
    row_player_2 = Ranking.where(player_id: player_2).first.row

    row_player_1 == row_player_2 or row_player_1 == row_player_2 + 1 or row_player_1 == row_player_2 - 1
  end

  after_create :create_timeline

  private

  def create_timeline
    Timeline.create_message_based_on_ranking(self)
  end

end