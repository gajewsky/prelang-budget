# Expenses Controller
class ExpensesController < ApplicationController
  def show
    @expense = Expense.find(params[:id])
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to expenses_url, notice: 'Expense was successfully destroyed.'
  end

  def tracking
    @trackings = Expense.trackable
  end
end
