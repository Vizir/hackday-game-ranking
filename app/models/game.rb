class Game < ActiveRecord::Base
  belongs_to :league
  attr_accessible :exhibition, :player1_id, :player1_score, :player1_team_id, :player2_id, :player2_score, :player2_team_id, :player1, :player2, :team1, :team2, :league, :league_id

  after_create :update_ranking
  validates_presence_of :player1_id, :player1_score, :player1_team_id, :player2_id, :player2_score, :player2_team_id, :league_id

  belongs_to :player1,  :class_name => "Player"
  belongs_to :player2,  :class_name => "Player"

  belongs_to :team1,  :class_name => "Team", :foreign_key => "player1_team_id"
  belongs_to :team2,  :class_name => "Team", :foreign_key => "player2_team_id"

  def winner
    if(player1_score > player2_score)
      return player1
    else
      return player2
    end
  end

  def loser
    if(player1_score < player2_score)
      return player1
    else
      return player2
    end 
  end

  def is_valid_for_ranking?
    Ranking.valid_for_ranking? self.player1, self.player2
  end

private

  def update_ranking
    if self.is_valid_for_ranking?
      self.league.update_ranking self
    else
      Timeline.create_message_based_on_game(self)
    end
  end

end

