# Bunch of view helper methods used both in incomes and expenses
module ApplicationHelper
  def sum_values(valuable)
    return 0 if valuable.empty?
    valuable.map(&:value).reduce(:+)
  end

  def number_to_pln(number)
    ActionController::Base.helpers.number_to_currency(number, unit: 'zł', format: '%n %u')
  end

  def flash_class(level)
    case level
      when 'notice' then 'alert alert-info'
      when 'success' then 'alert alert-success'
      when 'error' then 'alert alert-error'
      when 'alert' then 'alert alert-error'
    end
  end
end
