class WaitingRoomPlayersController < ApplicationController
  def create
    @waiting_room = WaitingRoom.find_by(room_code: params[:room_code])

    if @waiting_room
      player = Player.find_or_initialize_by(username: params[:username])
      if player.new_record?
        player.guest = true
        player.save
      end

      waiting_room_player = WaitingRoomPlayer.new(waiting_room: @waiting_room, player: player)
      waiting_room_player.save

      redirect_to waiting_room_path(@waiting_room)
    else
      flash[:alert] = "Invalid room code. Please try again."
      render "waiting_rooms/join"
    end
  end
end