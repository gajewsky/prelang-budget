# Model representing single income/expense subcategory
class Subcategory < ApplicationRecord
  validates :title, presence: true
  belongs_to :category
  has_many :expenses
  has_many :incomes

  def label
    "#{self&.category&.title} / #{title}"
  end
end
