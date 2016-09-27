# Dashboard Controller
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @incomes_sum = Income.all.map(&:amount).reduce(:+)
    @expenses_sum = Expense.all.map(&:amount).reduce(:+)
  end
end
