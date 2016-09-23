# Dashboard Controller
class DashboardController < ApplicationController
  before_filter :require_user_signed_in

  def index
    @incomes_sum = Income.pluck(:value).reduce(:+)
    @expenses_sum = Expense.pluck(:value).reduce(:+)
  end
end
