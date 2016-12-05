# Expenses Controller
class ExpensesController < ApplicationController
  before_action :set_expense, only: %i(show edit update destroy)

  def index
    @tags = Expense.tag_counts_on(:tags)
    expenses = params[:tag] ? Expense.tagged_with(params[:tag]) : Expense.all
    @expenses = expenses.reorder('operation_date DESC').page(params[:page])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user
    if @expense.save
      redirect_to new_expense_url, notice: 'Expense was successfully created.'
    else
      render :new
    end
  end

  def update
    if @expense.update(expense_params)
      redirect_to expenses_url, notice: 'Expense was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @expense.destroy
    redirect_to expenses_url, notice: 'Expense was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def expense_params
    params.require(:expense).permit(
      :operation_date,
      :description,
      :value,
      :to_divide,
      :subcategory_id,
      :user_id,
      :tag_list
    )
  end
end
