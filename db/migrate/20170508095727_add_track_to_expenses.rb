class AddTrackToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :track, :boolean, default: false
  end
end
