class Game < ActiveRecord::Base
  has_many :videos
  has_many :users
end
