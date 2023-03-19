class WaitingRoomsController < ApplicationController
  def create
    @waiting_room = WaitingRoom.new(name: params[:name])
    @waiting_room.room_code = WaitingRoom.generate_unique_room_code

    if @waiting_room.save
      waiting_room_player = WaitingRoomPlayer.new(waiting_room: @waiting_room, player: current_user, creator: true)
      waiting_room_player.save

      flash[:notice] = "Waiting room created successfully. Room code: #{@waiting_room.room_code}"
      redirect_to waiting_room_path(@waiting_room)
    else
      flash[:alert] = "Failed to create waiting room."
      redirect_to root_path
    end
  end

  def show
    @waiting_room = WaitingRoom.find(params[:id])
  end

  def join
  end

  def leave
    waiting_room = WaitingRoom.find(params[:id])
    waiting_room_player = waiting_room.waiting_room_players.find_by(player: current_user)
    
    if waiting_room_player.present?
        is_creator = waiting_room_player.creator

        waiting_room_player.destroy

        if is_creator
        waiting_room.destroy
        flash[:notice] = "You have left and deleted the waiting room."
        else
        flash[:notice] = "You have left the waiting room."
        end
    end

    redirect_to root_path
  end

  private

  def waiting_room_params
    params.require(:waiting_room).permit(:name, :room_code)
  end
end