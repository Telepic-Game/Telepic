class AddColumnsToPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :username, :string
    add_column :players, :guest, :boolean, null: false, default: true
  end
end
