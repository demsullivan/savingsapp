class SavingsTransactionsController < ApplicationController
  def index
    @profile = ContributionProfile.first
  end

  def create
    params = params_for_create_transaction
    @profile = ContributionProfile.find(params[:contribution_profile_id])
    @transaction = SavingsTransaction.new_from_profile(params[:amount].to_d, @profile)
    respond_to do |f|
      if @transaction.save
        f.json { render json: @transaction.children.all, status: :created, location: @transaction }
      else
        f.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def params_for_create_transaction
    params.require(:savings_transaction).permit(:amount, :contribution_profile_id)
  end
end
