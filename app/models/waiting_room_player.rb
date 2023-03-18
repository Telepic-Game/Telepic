class WaitingRoomPlayer < ApplicationRecord
  belongs_to :waiting_room
  belongs_to :player
end
