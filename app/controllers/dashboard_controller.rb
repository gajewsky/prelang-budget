# Dashboard Controller
class DashboardController < ApplicationController
  def index
    @incomes = Income.spent_between(date_range).where(user_id: user_ids)
    @expenses = Expense.spent_between(date_range).where(user_id: user_ids)
    @expenses_by_day = expenses_by_day
  end

  def overall
    @incomes = Income.where(user_id: user_ids)
    @expenses = Expense.where(user_id: user_ids)
    @savings_by_month = savings_by_month
  end

  private

  def date_range
    @date_range ||= begin
      from, to = params.dig('para', 'date')&.split('-')
      return Date.today.at_beginning_of_month..Date.today.at_end_of_month if from.nil? && to.nil?
      from.to_date..to.to_date
    end
  end

  def savings_by_month
    Saving
      .unscoped
      .group_by_month(:operation_date)
      .sum(:value)
      .map { |date, value| [date.strftime('%b %Y'), value.to_f] }
      .to_h
  end

  def expenses_by_day
    Expense
      .unscoped
      .spent_between(date_range)
      .where(user_id: user_ids)
      .group_by_day(:operation_date)
      .sum(:value)
      .map { |date, value| [date.strftime('%a %d %b'), value.to_f] }
      .to_h
  end
end
