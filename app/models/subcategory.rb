# Model representing single income/expense subcategory
class Subcategory < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :category
  has_many :expenses
  has_many :incomes

  def label
    "#{self&.category&.title} / #{title}"
  end

  def to_param
    "#{id}-#{category.title}-#{title}".parameterize
  end
end
