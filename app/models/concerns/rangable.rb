# Bunch of methods used both in incomes and expenses
module Rangable
  extend ActiveSupport::Concern

  included do
    default_scope -> { order('created_at DESC') }
    scope :spent_between, ->(date_range) { where(operation_date: date_range) }
  end

  def monthly
    operation_date.beginning_of_month..operation_date.end_of_month
  end
  # Class methods
  module ClassMethods
    def month_ranges
      all.group_by(&:monthly)
    end
  end
end
