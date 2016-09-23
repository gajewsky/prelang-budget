class Subcategory < ActiveRecord::Base
  validates :title, presence: true, uniqueness: true
  belongs_to :category
  has_many :expenses
end
