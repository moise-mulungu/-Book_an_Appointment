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

 

    def new
      @user = current_user
      @reservation = Reservation.new
    end
  
   def create
    @reservation=Reservation.new(reservation_params)
    @reservation.user= current_user
    @reservation.doctor=   Doctor.find(params[:doctor_id])
    if @reservation.save 
     redirect_to reservations_path
  end
 
 
 def set_reservation
   @reservation=Reservation.find(params[:id])
 end
 
  private
  def reservation_params
   params.require(:reservation).permit(:datetime)
  end
 
end
