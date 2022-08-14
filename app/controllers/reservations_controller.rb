class ReservationsController < ApplicationController
  before_action :set_reservation, only:[:edit, :update, :show]
  def index
    @reservation=Reservation.all
   end

   def show
   end

   def edit
   end

   def update
    if @reservation.update(reservation_params)
      redirect_to reservations_path
    else
      render 'edit'
    end
   end
  
end
