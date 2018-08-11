class MigrateBillsToContainExpenses < ActiveRecord::Migration[5.2]
  def up
    Expense.find_each do |expense|
      bill = Bill.create!(
        operation_date: expense.operation_date,
        user_id: expense.user_id,
        contractor_id: expense.contractor_id,
        to_divide: expense.to_divide
      )
      expense.update(bill_id: bill.id)
    end
  end

  def down
    Bill.delete_all
    Expense.update_all(bill_id: nil)
  end
end
