class User < ActiveRecord::Base
  has_many :games
  has_many :videos
  has_many :comments
  has_secure_password
  validates :gamertag, presence: true, uniqueness: {case_sensitive: false}
end
