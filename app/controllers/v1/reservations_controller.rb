class V1::ReservationsController < ApplicationController
  def index
    render json: Reservation.all
  end

  def create
    user = User.find_by(id: params[:user_id])
	  doctor = Doctor.find_by(id: params[:doctor_id])
	  reservation = Reservation.new(datetime: Date.parse(params[:date].to_s), user: user, doctor: doctor)

    if reservation.save
      render json : {success: "You successfully reserved #{doctor.name} on #{reservation.date}" }
    else
      render json: {failure: "Your Reservation failed. Please try again"}.to_json
    end
  end

  def destroy
    user = current-user
    @reservations = user.reserved_doctors(:reservations).select('reservations.id', :name, :image, :price, 'reservations.datetime').distinct
    reservation = Reservation.find_by(id: params[:id])
    
    if
      reservation.destroy
      render json: {reservations: @reservations, success: 'You successfully canceled the reservations !'}.to_json
    else
      render json: {failure: 'Something went wrong. Please, try again.'}.to_json
    end
  end

  def reservation_params
    params.require (:reservation).permit(:datetime, :user_id, :doctor_id)
  end
  
end
