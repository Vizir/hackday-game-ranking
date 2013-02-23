# -*- encoding : utf-8 -*-
class ProfilesController < ApplicationController

  def index
    
  end

  def show
    @p = Player.where(:username => params[:player_name]).first
    #puts @p.inspect

    @victorys = count_victorys @p
    @draws = count_draws @p.games
    @loses = count_loses @p
    if (@p.games.size > 0)
      @time = @p.most_used_team.name
    else
      @time = @p.username + ' ainda não jogou!'
    end
    @p.pictureUrl ||= 'user_avatar.png'
  end

  def count_draws(games)
    draws = 0
    games.each do |game|
      if (game.player1_score == game.player2_score)
        draws = draws + 1
      end
    end
    draws
  end
    
  def count_victorys(player)
    victorys = 0
    player.games.each do |game|
      if ((game.player1_score > game.player2_score && game.player1_id == player.id) || (game.player2_score > game.player1_score && game.player2_id == player.id))
        victorys = victorys + 1
      end
    end
    victorys
  end

  def count_loses(player)
    loses = 0
    player.games.each do |game|
      if ((game.player1_score > game.player2_score && game.player2_id == player.id) || (game.player2_score > game.player1_score && game.player1_id == player.id))
        loses = loses + 1
      end
    end
    loses
  end

  #def last_challenges(games)

  #end

  #def las_challenges_With_me(games, rival)

  #end
end