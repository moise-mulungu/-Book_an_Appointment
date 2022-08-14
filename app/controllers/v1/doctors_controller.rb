class V1::DoctorsController < ApplicationController
 
  def index
    render json: Doctor.all
    
  end

  def create
    @user = User.find(params[:user_id])
    @doctor = Doctor.new(doctor_params)
    @doctor.user_id=@user.id
    if @doctor.save
      render json: { status: 201, message: 'doctor created successfully!' , content: {doctor: @doctor}}
    else
      render json: { error: 401, message: ' doctor cannot be processed !'}
    end
  end

 
  def destroy
    @doctor = Doctor.find(params[:id])
   if @doctor.destroy
    render json: { status: 201, message: 'doctor has deleted successfully!' , content: {doctor: @doctor}}
  else
    render json: { error: 401, message: ' Operation did not succeed!'}
  end
end
  private

  def doctor_params
    params.permit(:name, :speciality)
  end
end
