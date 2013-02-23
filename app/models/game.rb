class Game < ActiveRecord::Base
  belongs_to :league
  attr_accessible :exhibition, :player1_id, :player1_score, :player1_team_id, :player2_id, :player2_score, :player2_team_id, :player1, :player2, :team1, :team2, :league, :league_id

  after_create :create_timeline, :update_ranking
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

private

  def create_timeline
    Timeline.create_message_based_on_game(self)
  end

  def update_ranking
    if Ranking.valid_for_ranking? self.player1, self.player2

      player1_ranking = Ranking.where(player_id: self.player1).first
      player2_ranking = Ranking.where(player_id: self.player2).first

      if (self.player1_score > self.player2_score and player1_ranking.position > player2_ranking.position) or
         (self.player1_score < self.player2_score and player1_ranking.position < player2_ranking.position)
        player1_ranking.player = self.player2
        player1_ranking.save
        player2_ranking.player = self.player1
        player2_ranking.save
      end
    end
  end

end

