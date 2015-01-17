class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true

  has_many :bets
  has_many :wagers

  DEFAULT_POINTS = 100

  before_create :set_default_points

  protected
  def set_default_points
    self.points ||= DEFAULT_POINTS
  end
end
