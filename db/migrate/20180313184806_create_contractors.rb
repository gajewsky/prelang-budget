class CreateContractors < ActiveRecord::Migration[5.1]
  def change
    create_table :contractors do |t|
      t.string :name
      t.text :description
      t.string :card_info
      
      t.timestamps
    end
  end
end
