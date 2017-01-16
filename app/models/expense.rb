# Model representing single expense
class Expense < ActiveRecord::Base
  include Rangable
  before_validation :set_operation_date
  acts_as_taggable
  paginates_per 30
  belongs_to :subcategory
  belongs_to :user
  validates :value, presence: true
  validates :operation_date, presence: true
  validates :subcategory, presence: true

  scope :dividable, -> { where(to_divide: true) }

  def self.group_by_category(expenses = Expense.all)
    expenses.group_by(&:subcategory).group_by { |sub| sub.first.category }
  end
end
