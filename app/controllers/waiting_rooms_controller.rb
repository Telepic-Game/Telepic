class WaitingRoomsController < ApplicationController
    def new    

        @waiting_room = WaitingRoom.new
        
        respond_to do |format|
            format.html # Render the default HTML template
            format.json { render json: @waiting_room } # Render JSON
        end
    end
end