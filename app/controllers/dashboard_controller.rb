# Dashboard Controller
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @incomes_sum = Income.pluck(:value).reduce(:+)
    @expenses_sum = Expense.pluck(:value).reduce(:+)
  end
end
