class League < ActiveRecord::Base
  attr_accessible :name
  has_many :rankings


  def update_ranking (game)

    player1_ranking = self.rankings.where(:player_id => game.player1).first
    player2_ranking = self.rankings.where(:player_id => game.player2).first

    if (game.player1_score > game.player2_score and player1_ranking.position > player2_ranking.position) or
       (game.player1_score < game.player2_score and player1_ranking.position < player2_ranking.position)
      change_ranking_position player1_ranking, player2_ranking
      create_ranking_messages_with_position_changed player1_ranking, player2_ranking,game
    else
      Timeline.create_message_without_position_change(player1_ranking, player2_ranking, game)
    end
    
  end

  def change_ranking_position (player1_ranking, player2_ranking)
    tmp_player = player1_ranking.player
    player1_ranking.player = player2_ranking.player
    player2_ranking.player = tmp_player
    player1_ranking.save
    player2_ranking.save
  end

  def create_ranking_messages_with_position_changed(player1_ranking, player2_ranking,game)
    if game.player1_score > game.player2_score 
      Timeline.create_message_based_on_ranking_update(player1_ranking, player2_ranking, game)
    else game.player1_score > game.player2_score
      Timeline.create_message_based_on_ranking_update(player2_ranking, player1_ranking, game)
    end
  end

end
