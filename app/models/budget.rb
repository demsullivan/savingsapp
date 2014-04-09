class Budget < ActiveRecord::Base
  has_many :contribution_profiles, :through => :contribution_rates
  has_many :contribution_rates, :dependent => :destroy

  validates :name, :goal, presence: true
  before_create do |budget|
    budget.balance = 0.0 if budget.balance.nil?
  end
end
