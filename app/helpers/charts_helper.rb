# Bunch of view helper methods used for expenses
module ChartsHelper
  def expense_for_chart(expenses)
    expenses.group_by_category.map do |array|
      subcategories = array.second
      expenses = subcat_exp_sums(subcategories)
      {
        expenses: expenses.reduce(:+),
        drilldown: {
          name: array.first.title,
          categories: subcategories.map { |sub| sub.first.title },
          data: expenses
        }
      }
    end.to_json
  end

  def categories_titles(expenses)
    expenses.group_by_category.keys.map(&:title)
  end

  private

  def subcat_exp_sums(subcategories)
    subcategories.map { |s| s.second.map { |e| e.value.to_f.round }.reduce(:+) }
  end
end
