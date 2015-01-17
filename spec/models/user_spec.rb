require 'rails_helper'

RSpec.describe User, :type => :model do
  let (:user1) { FactoryGirl.create(:user) }

  describe "With valid data" do
    subject { user1 }
    it { should be_valid }
    it "starts off with a default amount of points" do
      expect(user1.points).to eq User::DEFAULT_POINTS
    end
  end

  describe "With duplicate usernames" do
    let (:user2) { FactoryGirl.build(:user, username: user1.username) }
    subject { user2 }
    it { should_not be_valid }
  end

  describe "With duplicate emails" do
    let (:user2) { FactoryGirl.build(:user, email: user1.email) }
    subject { user2 }
    it { should_not be_valid }
  end

  describe "Without an email address" do
    let (:user2) { FactoryGirl.build(:user, email: nil) }
    subject { user2 }
    it { should_not be_valid }   
  end

  describe "Without a username" do
    let (:user2) { FactoryGirl.build(:user, username: nil) }
    subject { user2 }
    it { should_not be_valid }
  end

  describe "When creating bets" do
    let (:bet)  { FactoryGirl.create(:bet, user: user1) }

    it "adds the bet to the user" do
      expect(user1.bets).to include(bet)
    end

    it "adds the user to the bet too" do
      expect(bet.user).to eq user1
    end
  end

  describe "When placing wagers" do
    let (:bet) { FactoryGirl.create(:bet) }
    let (:outcome) { FactoryGirl.create(:outcome, bet: bet) }
    let (:wager) { FactoryGirl.create(:wager, user: user1, bet: bet, outcome: outcome) }

    it "adds the wager to the user" do
      expect(user1.wagers).to include(wager)
    end

    it "adds the user to the wager too" do
      expect(wager.user).to eq user1
    end
  end
end
