class AddUserToIncomes < ActiveRecord::Migration[5.0]
  def change
    add_column :incomes, :description, :text
    add_reference :incomes, :user, index: true
  end
end
