class DoctorsController < ApplicationController
  before_action :set_Doctor, only:[:edit, :update, :show]
    
   def index
    @doctor=Doctor.all
   end
   
  def new
    @doctor=Doctor.new
  end

  def create
    @doctor=Doctor.new(Doctor_params)
    if @doctor.save
      redirect_to doctor_path(@doctor)
    else
      render 'new'
    end
  end

  def edit 
 
  end

  def update 
    if @doctor.update( doctor_params)
      redirect_to doctors_path
      else
        render 'edit'
      end
  end

  def show 
  
  end 
  
  def destroy 
    @doctor =Doctor.find(params[:id])
    @doctor.destroy
    redirect_to doctors_path
  end

  def set_doctor 
    @doctor= Doctor.find(params[:id])
  end
  private 
  def doctor_params
     params.require(:doctor).permit(:name, :speciality, :user_id)
  end

 
  

end
