class V1::ReservationsController < ApplicationController
  def index
    @reservations = User.find(params[:user_id]).reservations
    render json: @reservations  
  end

  def create
    @reservation = User.find(params[:user_id]).reservations.new(reservation_params)
    if @reservation.save
      render json: @reservation
    else
      render json: { error: 'You are not authorized to access this page' }.to_json
    end
  end

  def destroy
    @reservation = User.find(params[:user_id]).reservations.find(params[:id])
    if @reservation.destroy
      render json: { success: 'You successfully deleted your reservation' }.to_json
    else
      render json: { error: 'You are not authorized to access this page' }.to_json
    end
 
  end

  def reservation_params
    params.require(:reservation).permit(:datetime, :user_id, :doctor_id)
  end
end
