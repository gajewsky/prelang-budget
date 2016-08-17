class Expense < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :subcategory
  belongs_to :user

  def self.group_by_subcategory(expenses = Expense.all)
    expenses.group_by(&:subcategory).map do |subcategory, expenses|
      [subcategory&.title, expenses.map(&:value).reduce(:+)]
    end
  end
end
