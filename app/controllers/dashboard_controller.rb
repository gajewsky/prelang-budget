# Dashboard Controller
class DashboardController < ApplicationController
  def index
    @incomes = Income.spent_between(date_range).where(user_id: user_ids)
    @expenses = Expense.spent_between(date_range).where(user_id: user_ids)
  end

  def overall
    @incomes = Income.where(user_id: user_ids)
    @expenses = Expense.where(user_id: user_ids)
  end

  private

  def date_range
    @date_range ||= begin
      from, to = params.dig('para', 'date')&.split('-')
      return Date.today.at_beginning_of_month..Date.today.at_end_of_month if from.nil? && to.nil?
      from.to_date..to.to_date
    end
  end

  def user_ids
    params.dig('users') || User.pluck(:id)
  end
end
