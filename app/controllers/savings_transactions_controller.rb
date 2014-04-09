class SavingsTransactionsController < ApplicationController
  def index
    @profile = ContributionProfile.all()[0]
  end

  def create
    @profile = ContributionProfile.find(params[:transaction][:contribution_profile_id])
    @transaction = SavingsTransaction.new_from_profile(params[:transaction][:amount], @profile)
    respond_to do |f|
      if @transaction
        f.json { render json: @transaction.children.all, status: :created, location: @transaction }
      else
        f.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def params_for_create_transaction
    params.require(:transaction).permit(:amount, :contribution_profile_id)
  end
end
