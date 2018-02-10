class CreateSubcategories < ActiveRecord::Migration[5.0]
  def change
    create_table :subcategories do |t|
      t.string :title
      t.text :description
      t.references :category, index: true

      t.timestamps
    end
  end
end
