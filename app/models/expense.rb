# Model representing single expense
class Expense < ApplicationRecord
  include PgSearch
  include Rangable

  before_validation :set_operation_date
  acts_as_taggable
  paginates_per 30
  belongs_to :subcategory
  belongs_to :user
  belongs_to :contractor
  validates :value, presence: true
  validates :operation_date, presence: true
  validates :subcategory, presence: true

  scope :dividable, -> { where(to_divide: true) }
  scope :trackable, -> { where(track: true) }
  pg_search_scope :search_by_description, against: :description

  def self.group_by_category(expenses = Expense.all)
    expenses.group_by(&:subcategory).group_by { |sub| sub.first.category }
  end
end
