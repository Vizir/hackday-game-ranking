class Team < ActiveRecord::Base
  attr_accessible :attack, :defense, :logo, :middle, :name, :score
end
