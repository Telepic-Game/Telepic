class WaitingRoomsController < ApplicationController

  def create
    @waiting_room = WaitingRoom.new(name: params[:name])
    @waiting_room.room_code = WaitingRoom.generate_unique_room_code

    if @waiting_room.save
      # Create a new waiting room player
      waiting_room_player = WaitingRoomPlayer.new(waiting_room: @waiting_room, player: current_user)
      waiting_room_player.save

      flash[:notice] = "Waiting room created successfully. Room code: #{@waiting_room.room_code}"
      redirect_to new_waiting_room_path(id: @waiting_room.id)
    else
      flash[:alert] = "Failed to create waiting room."
      redirect_to root_path
    end
  end

  def show
    @waiting_room = WaitingRoom.find(params[:id])
  end

  private

  def waiting_room_params
    params.require(:waiting_room).permit(:name, :room_code)
  end
end