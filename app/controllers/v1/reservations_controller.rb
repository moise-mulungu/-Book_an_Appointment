class V1::ReservationsController < ApplicationController

  def index
    render json: Reservation.all
   end

   def create
    @user = User.find(params[:user_id])
    @reservation=Reservation.new(reservation_params)
    @reservation.user_id= @user.id
    @reservation.doctor_id=  reservation_params[:doctor_id]
    if @reservation.save 
      render json: { status: 201, message: 'Reserved successfully!' , content: {reservation: @reservation}}
    else
      render json: { error: 401, message: ' Operation did not succeed!'}
  end
end

  private

  def reservation_params
   params.permit(:datetime, :doctor_id )
  end
 
end
