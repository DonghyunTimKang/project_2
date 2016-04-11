class Game < ActiveRecord::Base
  has_many :medium
  has_many :users
end
