class AddRoomCodeToWaitingRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :waiting_rooms, :room_code, :string
  end
end
