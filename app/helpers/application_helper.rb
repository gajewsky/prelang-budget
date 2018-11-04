# Bunch of view helper methods used both in incomes and expenses
module ApplicationHelper
  BUDGET_START_DATE = '2016-09-01'.to_date

  def sum_values(valuable)
    return 0 if valuable.empty?
    valuable.map(&:value).reduce(:+)
  end

  def number_to_pln(number)
    ActionController::Base.helpers.number_to_currency(number, unit: 'zł', format: '%n %u')
  end

  def pln_per_month(number)
    return 0 unless number
    today = Date.today
    result = number.to_f / ((today.year * 12 + today.month) - (BUDGET_START_DATE.year * 12 + BUDGET_START_DATE.month))
    ActionController::Base.helpers.number_to_currency(result, unit: 'zł', format: '%n %u')
  end

  def pln_per_day(number)
    return 0 unless number
    result = number / (Date.today - BUDGET_START_DATE).to_f

    ActionController::Base.helpers.number_to_currency(result, unit: 'zł', format: '%n %u')
  end

  def flash_class(level)
    case level
    when 'notice' then 'alert alert-info'
    when 'success' then 'alert alert-success'
    when 'error' then 'alert alert-error'
    when 'alert' then 'alert alert-error'
    end
  end

  def debit(bills)
    dividable_sum = sum_values(bills.dividable)
    cu_share = sum_values(bills.dividable.where(user: current_user))
    ou_share = dividable_sum - cu_share
    (cu_share - ou_share) / 2.0
  end
end
