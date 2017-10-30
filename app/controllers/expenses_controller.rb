# Expenses Controller
class ExpensesController < ApplicationController
  before_action :set_expense, only: %i[show edit update destroy]

  def index
    @total_value = expenses.map(&:value).reduce(:+)
    @expenses = expenses.page(params[:page])
  end

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.user_id ||= current_user.id
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

  def tracking
    @trackings = expenses.trackable
  end

  private

  def expenses
    @expenses ||= begin
      expenses = expenses_with_relations.where(user_id: user_ids)
      expenses = expenses.tagged_with(params[:tag]) if params[:tag]
      expenses = expenses.dividable if params[:dividable]
      expenses.reorder('operation_date DESC')
    end
  end

  def expenses_with_relations
    expenses = Expense.includes(:taggings, :user, subcategory: :category)
    params[:q] ? expenses.search_by_description(params[:q]) : expenses
  end

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
      :track,
      :subcategory_id,
      :user_id,
      :tag_list
    )
  end
end
