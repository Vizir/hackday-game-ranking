class Team < ActiveRecord::Base
  
  has_many :games

  attr_accessible :attack, :defense, :logo, :middle, :name, :score
end
