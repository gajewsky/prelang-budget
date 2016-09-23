# Incomes Controller
class IncomesController < ApplicationController
  before_filter :require_user_signed_in
  before_action :set_income, only: [:show, :edit, :update, :destroy]

  def index
    @incomes = Income.all
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    @income.user = current_user
    if @income.save
      redirect_to incomes_url, notice: 'Income was successfully created.'
    else
      render :new
    end
  end

  def update
    if @income.update(income_params)
      redirect_to incomes_url, notice: 'Income was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @income.destroy
    redirect_to incomes_url, notice: 'Income was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_income
    @income = Income.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def income_params
    params.require(:income).permit(:value, :earn_date, :description, :subcategory_id, :user_id)
  end
end
