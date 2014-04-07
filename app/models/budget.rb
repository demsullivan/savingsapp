class Budget < ActiveRecord::Base
  has_many :contribution_profiles, :through => :contribution_rates
  has_many :contribution_rates, :dependent => :destroy
end
