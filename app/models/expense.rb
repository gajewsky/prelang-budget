# Model representing single expense
class Expense < ActiveRecord::Base
  include Rangable
  acts_as_taggable
  validates :value, presence: true
  belongs_to :subcategory
  belongs_to :user

  monetize :value, as: 'amount'

  def self.group_by_subcategory(expenses = Expense.all)
    expenses.group_by(&:subcategory).map do |subcategory, subexpenses|
      [subcategory&.label, subexpenses.map(&:value).reduce(:+)]
    end
  end
end
