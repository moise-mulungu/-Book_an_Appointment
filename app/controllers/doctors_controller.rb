class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
  end

  def update
  end

  def delete
  end
end
