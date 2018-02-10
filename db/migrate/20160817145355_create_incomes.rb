class CreateIncomes < ActiveRecord::Migration[5.0]
  def change
    create_table :incomes do |t|
      t.decimal :value
      t.datetime :earn_date
      t.references :subcategory, index: true

      t.timestamps
    end
  end
end
