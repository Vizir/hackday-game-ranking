class Timeline < ActiveRecord::Base
  belongs_to :league
  belongs_to :game  

  attr_accessible :game, :league, :message

  validates_presence_of :league, :message

  def self.create_message_based_on_game (game)
    puts "*" * 88
    Timeline.create :message => "@#{game.winner[:username]} ganhou de @#{game.loser[:username]}", 
                    :league => game.league
  end
end
