class ReservationsController < ApplicationController
  before_action :set_reservation, only:[:edit, :update, :show]
  def index
    @reservation=Reservation.all
   end

   def show
   end

   def edit
   end

end
