class DoctorsController < ApplicationController
  before_action :set_Doctor, only:[:edit, :update, :show]
    
   def index
    @doctor=Doctor.all
   end
 
  
end
