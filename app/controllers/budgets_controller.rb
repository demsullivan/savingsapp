class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def create
    @budget = Budget.new(params_for_create_budget)
    respond_to do |f|
      if @budget.save
        f.json { render json: @budget, status: :created, location: @budget }
      else
        j.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  def params_for_create_budget
    params.require(:budget).permit(:name, :goal)
  end

end
