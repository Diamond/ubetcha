class Bet < ActiveRecord::Base
  belongs_to :user
  has_many :outcomes
  has_many :wagers
end
