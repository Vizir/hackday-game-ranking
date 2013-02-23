class Game < ActiveRecord::Base
  belongs_to :league
  attr_accessible :exhibition, :player1_id, :player1_score, :player1_team_id, :player2_id, :player2_score, :player2_team_id, :player1, :player2

  belongs_to :player1,  :class_name => "Player"
  belongs_to :player2,  :class_name => "Player"
end
