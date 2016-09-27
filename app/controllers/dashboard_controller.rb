# Dashboard Controller
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @incomes = Income.spent_between(date_range)
    @expenses = Expense.spent_between(date_range)
  end

  private

  def expense_months
    @expense_months ||= Expense.month_ranges.keys.sort_by(&:min)
  end

  def date_range
    @date_range ||= begin
      from = params['from']
      to = params['to']
      return expense_months.last if from.nil? && to.nil?
      from.to_date..to.to_date
    end
  end
end
