class WaitingRoom < ApplicationRecord
  has_many :waiting_room_players, dependent: :destroy
  has_many :players, through: :waiting_room_players

  def self.generate_unique_room_code
    loop do
      room_code = SecureRandom.alphanumeric(6).upcase
      break room_code unless WaitingRoom.exists?(room_code: room_code)
    end
  end
end




