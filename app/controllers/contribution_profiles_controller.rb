class ContributionProfilesController < ApplicationController
  def index
    @profiles = ContributionProfile.all
    @budgets = Budget.all
  end

  def create
    @profile = ContributionProfile.new(params_for_create_profile)
    respond_to do |f|
      if @profile.save
        f.json { render json: @profile, status: :created, location: @profile }
      else
        f.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def params_for_create_profile
    params.require(:contribution_profile).permit(:name,
      :contribution_rates_attributes => [:budget_id, :rate]
      )
  end
end
