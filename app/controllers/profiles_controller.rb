class ProfilesController < ApplicationController

  def index
    
  end

  def show
    @time = ""
    @p = Player.where(:username => params[:player_name]).first
    #puts @p.inspect
    @games = @p.games

    @victorys = count_victorys @games, @p
    @draws = count_draws @games
    @loses = count_loses @games, @p
    puts @games.inspect
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
    
  def count_victorys(games, player)
    victorys = 0
    games.each do |game|
      if ((game.player1_score > game.player2_score && game.player1_id == player.id) || (game.player2_score > game.player1_score && game.player2_id == player.id))
        victorys = victorys + 1
      end
    end
    victorys
  end

  def count_loses(games, player)
    loses = 0
    games.each do |game|
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