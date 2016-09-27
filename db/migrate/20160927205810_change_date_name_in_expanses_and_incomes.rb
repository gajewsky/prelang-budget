class ChangeDateNameInExpansesAndIncomes < ActiveRecord::Migration
  def change
    rename_column :incomes, :earn_date, :operation_date
    rename_column :expenses, :spent_date, :operation_date
  end
end
