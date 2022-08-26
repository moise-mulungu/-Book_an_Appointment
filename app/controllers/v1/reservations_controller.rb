class V1::ReservationsController < ApplicationController
  def index
    # @reservations =  User.find(params[:user_id]).reservations
    @user = User.find(params[:user_id])
    @reservations = @user.reservations.includes(:doctor)
    render json: @reservations.as_json(include: :doctor)
  end

  def create
    @user = User.find(params[:user_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.user_id = @user.id
    @reservation.doctor_id = reservation_params[:doctor_id]

    if @reservation.save
      # reservation = Reservation.find(reservation.id)
      render json: { status: 201, message: 'Reserved successfully!', content: { reservation:  @reservation} }
    else
      render json: { error: 401, message: ' Operation did not succeed!' }
    end
  end

  private

  def reservation_params
    params.permit(:datetime, :city, :doctor_id)
  end
end
