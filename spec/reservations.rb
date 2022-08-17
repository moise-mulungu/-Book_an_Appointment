require 'rails_helper'

RSpec.describe 'Reservation', type: :request do
  user = User.create(username: 'Moise')
  doctor = Doctor.create(name: 'Dr. Moise', speciality: 'General Practitioner', user: user)
  reservation = Reservation.create(datetime: '2022-09-09', user: user, doctor: doctor)

    it 'should return the reservation' do
        expect(reservation.doctor).to eq(doctor)
    end

    it 'should return the reservation' do
        expect(reservation.user).to eq(user)
    end
    it 'should return the reservation' do
        expect(reservation.datetime).to_not eq('2022-09-09')
    end

    it 'is not valid without a doctor' do
        reservation = Reservation.new(datetime: '2022-09-09', user: user)
        expect(reservation).to_not be_valid
    end
    it 'is not valid without a user' do
        reservation = Reservation.new(datetime: '2022-09-09', doctor: doctor)
        expect(reservation).to_not be_valid
    end
    it 'is not valid without a datetime' do
        reservation = Reservation.new(doctor: doctor, user: user)
        expect(reservation).to_not be_valid
    end

    it 'is valid with a doctor\'s name longer than 30 characters' do
        reservation = Reservation.new(doctor: doctor, user: user, datetime: '2022-09-09')
        doctor.name = 'a' * 31
        expect(reservation).to be_valid
    end
    it 'is valid with a doctor\'s name shorter than 3 characters' do
        reservation = Reservation.new(doctor: doctor, user: user, datetime: '2022-09-09')
        doctor.name = 'a' * 2
        expect(reservation).to be_valid
    end
    it 'is valid with a doctor\'s name containing numbers' do
        reservation = Reservation.new(doctor: doctor, user: user, datetime: '2022-09-09')
        doctor.name = 'a1'
        expect(reservation).to be_valid
    end
    it 'is valid with a doctor\'s name containing special characters' do
        reservation = Reservation.new(doctor: doctor, user: user, datetime: '2022-09-09')
        doctor.name = 'a@'
        expect(reservation).to be_valid
    end

end