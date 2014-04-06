* Enter custom financial targets
* Enter contribution profiles
  * Different sets of contribution divisions
* Enter contributions, selecting a contribution profile to use
* View the transaction log
* View projections and target achievement dates
* Suggest contribution rates based on target deadlines


MODELS

Budget
 - name
 - balance
 - goal
 - notes

ContributionProfile
 - name

ContributionRate
 - budget_id
 - contributionprofile_id
 - rate

Transaction
 - date
 - amount
 - parent_id
 - budget_id
 - notes
