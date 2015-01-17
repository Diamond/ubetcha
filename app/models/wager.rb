class Wager < ActiveRecord::Base
  belongs_to :user
  belongs_to :bet
  belongs_to :outcome
end
