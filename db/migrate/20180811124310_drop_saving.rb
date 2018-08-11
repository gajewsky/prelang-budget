class DropSaving < ActiveRecord::Migration[5.1]
  def change
    drop_table "savings", id: :serial, force: :cascade do |t|
      t.datetime "operation_date"
      t.text "description"
      t.decimal "value"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
