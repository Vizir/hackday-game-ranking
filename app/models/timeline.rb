class Timeline < ActiveRecord::Base
  belongs_to :league
  belongs_to :game  

  attr_accessible :game, :league, :message

  validates_presence_of :league, :message

  def self.create_message_based_on_game (game)
    game_message (game.player1_score - game.player2_score)
    Timeline.create :message => "@#{game.player1.username} #{game.player1_score} X #{game.player2_score}  @#{game.player2.username}.", 
                    :league => game.league, :game => game
  end

  def self.create_message_based_on_ranking (ranking)
    Timeline.create :message => "@#{ranking.player.username} entrou no ranking.", 
                    :league => ranking.league
  end

private
  def game_message(score)
    

  end
end
