class Contractor < ApplicationRecord
  has_many :bills
  has_many :expenses

  validates :name, presence: true
end
