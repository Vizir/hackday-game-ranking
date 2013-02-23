# -*- encoding : utf-8 -*-

class Timeline < ActiveRecord::Base
  belongs_to :league
  belongs_to :game  

  attr_accessible :game, :league, :message

  validates_presence_of :league, :message

  acts_as_commentable

  def self.create_message_based_on_game (game)
      Timeline.create :message => "@#{game.player1.username} #{game.player1_score} X #{game.player2_score}  @#{game.player2.username}. #{game_message(game)}", 
                    :league => game.league, :game => game
  end

  def self.create_message_based_on_ranking (ranking)
    Timeline.create :message => "@#{ranking.player.username} entrou no ranking.", 
                    :league => ranking.league
  end

  def self.create_message_based_on_ranking_update (ranking_winner, ranking_loser, game)
    Timeline.create :message => "#{ranking_message(ranking_winner, ranking_loser)} @#{game.player1.username} #{game.player1_score} X #{game.player2_score}  @#{game.player2.username}. #{game_message(game)}", 
                    :league => game.league, :game => game
  end    

  def self.create_message_without_position_change(player1_ranking, player2_ranking, game)
    Timeline.create :message => "#{ranking_message_without_change(player1_ranking, player2_ranking)} @#{game.player1.username} #{game.player1_score} X #{game.player2_score}  @#{game.player2.username}. #{game_message(game)}", 
                    :league => game.league, :game => game
  end

private

  def self.ranking_message(ranking_winner, ranking_loser)
    winner = ranking_winner.player
    loser = ranking_loser.player

    ranking_messages = [
      "@#{winner.username} foi para #{ranking_winner.position} lugar.",
      "@#{loser.username} caiu para #{ranking_loser.position} lugar.", 
      "@#{winner.username} agora é o #{ranking_winner.position} e @#{loser.username} o #{ranking_loser.position}.",
      "A #{ranking_winner.position} é ocupada por @#{winner.username}." 
    ]

    first_messages = [
      "Temos um novo líder, o @#{winner.username}.",
      "Pintou o campeão, vai @#{winner.username}.",
      "É... durou pouco, agora o @#{loser.username} não é mais o líder.",
      "Vai trabalhar @#{winner.username}. Jogou tanto que agora é o primeiro."
    ]

    if ranking_winner.position == 1 
      first_messages.sample
    else
      ranking_messages.sample
    end

  end

  def self.ranking_message_without_change(ranking_winner, ranking_loser)
    winner = ranking_winner.player
    loser = ranking_loser.player

    ranking_messages = [
      "E nada foi alterado no ranking!",
      "Apesar do esforço, a posição foi mantida.",
      "Esta posição dele e ninguém tira." 
    ]

    ranking_messages.sample
  end

  def self.game_message(game)
    big_win_message = [
      "GOLEADA!!!",
      "CHUPA @#{game.loser.username}!!",
      "Ótima Partida do @#{game.winner.username}.",
      "É melhor o @#{game.loser.username} treinar mais!"
    ]

    win_messages = [
      "Boa vitória do @#{game.winner.username}!!",
      "Foi sofrido, mas o que vale é a vitória.",
      "É, o @#{game.loser.username} não consegue ganhar mesmo."
    ]

    draw_messages = [
      "Empate.",
      "Foi um empate, mas o jogo foi disputado.",
      "Apesar dos gols, os times não sairam do empate"
    ]

    oxo_messages = [
      "Que jogo chato!",
      "Jogo tão ruim que nenhum dos dois conseguiu fazer gol.",
      "Os atacantes estão com o pé torto!"
    ]

    goals_diff = (game.player1_score - game.player2_score).abs

    if(goals_diff > 2)
      return big_win_message.sample
    elsif(goals_diff > 0)
      return win_messages.sample
    elsif game.player1_score > 0 
      return draw_messages.sample
    else
      return oxo_messages.sample
    end
  end
end
