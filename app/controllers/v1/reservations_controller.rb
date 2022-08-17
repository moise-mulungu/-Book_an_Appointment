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
end
