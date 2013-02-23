class Ranking < ActiveRecord::Base
  
  belongs_to :league
  belongs_to :player
  attr_accessible :position, :player, :league, :row


  def self::valid_for_ranking?(player_1, player_2)
    row_player_1 = Ranking.where(player_id: player_1).first.row
    row_player_2 = Ranking.where(player_id: player_2).first.row

    row_player_1 == row_player_2 or row_player_1 == row_player_2 + 1 or row_player_1 == row_player_2 - 1
  end

end