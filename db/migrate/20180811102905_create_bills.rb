class CreateBills < ActiveRecord::Migration[5.1]
  def change
    create_table :bills do |t|
      t.datetime :operation_date
      t.references :user
      t.references :contractor
      t.boolean "to_divide", default: false

      t.timestamps
    end

    add_reference :expenses, :bill
  end
end
