# Model representing single income
class Income < ActiveRecord::Base
  include Rangable
  validates :value, presence: true
  belongs_to :subcategory
  belongs_to :user

  def self.group_by_subcategory(incomes = Income.all)
    incomes.group_by(&:subcategory).map do |subcategory, subincomes|
      [subcategory&.title, subincomes.map(&:value).reduce(:+)]
    end
  end
end
