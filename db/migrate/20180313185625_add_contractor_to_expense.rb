class AddContractorToExpense < ActiveRecord::Migration[5.1]
  def change
    add_reference :expenses, :contractor, index: true
  end
end
