# frozen_string_literal: true
class AddToDivideToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :to_divide, :boolean, default: false
  end
end
