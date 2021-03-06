class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :games
  has_many :rankings

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :name, :picture_url
  # attr_accessible :title, :body

  def leagues
    rankings = Ranking.where(:player_id => self.id)
    league_ids = []
    rankings.each do |r|
      league_ids << r.league_id
    end
    leagues = League.where(:id => league_ids)
    leagues
  end

  def games
    Game.where("player1_id = ? or player2_id = ?",self.id,self.id).order('id desc').all
  end

  def games_with_me(player_id)
    Game.where("(player1_id = ? or player2_id = ?) and (player1_id = ? or player2_id = ?)",self.id,self.id,player_id, player_id).order('id desc').all
  end

  def most_used_team
    mysql_res = ActiveRecord::Base.connection.execute("select team_id, sum(ct) ct from (select player1_team_id team_id, count(*) ct from games where player1_id = #{self.id} group by player1_team_id  union select player2_team_id team_id, count(*) ct from games where player2_id = #{self.id} group by player2_team_id) a order by ct desc")
    #mysql_res.each_hash{ |res| puts result.ct }
    mysql_res.first[0]
    Team.find(mysql_res.first[0])
  end

  def greatest_defeat
    Game.where("(player1_id = #{self.id} and player1_score<player2_score) or (player2_id = #{self.id} and player2_score<player1_score)").order('IF(player1_score > player2_score, player1_score-player2_score, player2_score-player1_score) DESC').order('IF(player1_score > player2_score, player1_score, player2_score) DESC')
  end

end
