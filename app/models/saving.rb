# Model representing single saving
class Saving < ActiveRecord::Base
  include Rangable
  before_validation :set_operation_date

  paginates_per 30
  validates :value, presence: true
  validates :operation_date, presence: true
end
