class DashboardController < ApplicationController
  def index
    @incomes_sum = Income.pluck(:value).reduce(:+)
    @expenses_sum = Expense.pluck(:value).reduce(:+)
  end
end
