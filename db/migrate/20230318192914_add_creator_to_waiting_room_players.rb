class AddCreatorToWaitingRoomPlayers < ActiveRecord::Migration[7.0]
  def change
    add_column :waiting_room_players, :creator, :boolean
  end
end
