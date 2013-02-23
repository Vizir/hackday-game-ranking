class Ranking < ActiveRecord::Base
  belongs_to :league
  belongs_to :player
  attr_accessible :position
end
