class CreateSavings < ActiveRecord::Migration
  def change
    create_table :savings do |t|
      t.datetime :operation_date
      t.text :description
      t.decimal :value

      t.timestamps
    end
  end
end
