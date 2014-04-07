class ContributionProfile < ActiveRecord::Base
  has_many :budgets, :through => :contribution_rates
  has_many :contribution_rates, :dependent => :destroy

  accepts_nested_attributes_for :contribution_rates
end
