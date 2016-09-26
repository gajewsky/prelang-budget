# Model representing single income/expense subcategory
class Subcategory < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  belongs_to :category
  has_many :expenses

  def label
    "#{self&.category&.title} / #{title}"
  end
end
