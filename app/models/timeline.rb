class Timeline < ActiveRecord::Base
  belongs_to :league
  belongs_to :game  

  attr_accessible :game, :league, :message

  validates_presence_of :league, :message

  def self.create_message_based_on_game (game)
    Timeline.create :message => "@#{game.winner[:username]} ganhou de @#{game.loser[:username]}.", 
                    :league => game.league, :game => game
  end

  def self.create_message_based_on_ranking (ranking)
    Timeline.create :message => "@#{ranking.player.username} entrou no ranking.", 
                    :league => ranking.league
  end
end
