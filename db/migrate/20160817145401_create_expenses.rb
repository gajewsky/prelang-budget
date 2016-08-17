class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.datetime :spent_date
      t.text :description
      t.decimal :value
      t.references :subcategory, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
