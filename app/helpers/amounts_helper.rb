# Bunch of view helper methods used both in incomes and expenses
module AmountsHelper
  def sum_values(valuable)
    return 0 if valuable.empty?
    valuable.map(&:value).reduce(:+)
  end

  def number_to_pln(number)
    ActionController::Base.helpers.number_to_currency(number, unit: 'zł', format: '%n %u')
  end
end
