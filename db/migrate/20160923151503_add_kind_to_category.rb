class AddKindToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :kind, :integer, default: 0
  end
end
