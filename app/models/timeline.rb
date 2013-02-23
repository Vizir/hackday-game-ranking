# -*- encoding : utf-8 -*-

class Timeline < ActiveRecord::Base
  belongs_to :league
  belongs_to :game  

  attr_accessible :game, :league, :message

  validates_presence_of :league, :message

  def self.create_message_based_on_game (game)
    
    Timeline.create :message => "@#{game.player1.username} #{game.player1_score} X #{game.player2_score}  @#{game.player2.username}. #{game_message(game)}", 
                    :league => game.league, :game => game
  end

  def self.create_message_based_on_ranking (ranking)
    Timeline.create :message => "@#{ranking.player.username} entrou no ranking.", 
                    :league => ranking.league
  end

private
  def game_message(game)
    big_win_message = [
      "GOLEADA!!!",
      "CHUPA #{game.loser.username}!!",
      "Ótima Partida do #{game.winner.username}"
    ]

    win_messages = [
      "Boa vitória do #{game.winner.username}!!"
    ]

    draw_messages = [
      "Empate"
    ]

    goals_diff = (game.player1_score - game.player2_score).abs

    if(goals_diff > 2)
      return big_win_message.sample
    elsif(goals_diff == 0)
      return draw_messages.sample
    else
      return win_messages.sample
    end
  end
end
