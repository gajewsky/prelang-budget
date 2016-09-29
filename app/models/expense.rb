# frozen_string_literal: true
# Model representing single expense
class Expense < ActiveRecord::Base
  include Rangable
  acts_as_taggable
  belongs_to :subcategory
  belongs_to :user
  validates :value, presence: true
  validates :subcategory, presence: true

  scope :dividable, -> { where(to_divide: true) }

  def self.group_by_subcategory(expenses = Expense.all)
    expenses.group_by(&:subcategory).map do |subcategory, subexpenses|
      [subcategory&.label, subexpenses.map(&:value).reduce(:+)]
    end
  end

  def self.group_by_category(expenses = Expense.all)
    expenses
      .joins(:subcategory)
      .group_by { |e| e.subcategory.category }
      .map do |category, subexpenses|
        [category.title, subexpenses.map(&:value).reduce(:+)]
      end
  end
end
