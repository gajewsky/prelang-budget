class AddUserToIncomes < ActiveRecord::Migration
  def change
    add_column :incomes, :description, :text
    add_reference :incomes, :user, index: true
  end
end
