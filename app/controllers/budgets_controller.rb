class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def create
    params.permit!
    @budget = Budget.new(params[:budget])
    respond_to do |f|
      if @budget.save
        f.json { render json: @budget, status: :created, location: @budget }
      else
        j.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

end
