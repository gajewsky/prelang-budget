class AddRevolutInfoToContractor < ActiveRecord::Migration[6.0]
  def change
    add_column :contractors, :revolut_id, :string
  end
end
