class AddSubcategoryIdToContractor < ActiveRecord::Migration[6.0]
  def change
    add_reference :contractors, :subcategory, index: true
  end
end
