class Income < ActiveRecord::Base
  validates :value, presence: true
  belongs_to :subcategory
  belongs_to :user
end
