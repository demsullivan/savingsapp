class ContributionRate < ActiveRecord::Base
  belongs_to :budget
  belongs_to :contribution_profile
end
