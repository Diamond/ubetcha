class Outcome < ActiveRecord::Base
  belongs_to :bet
  has_many :wagers
end
