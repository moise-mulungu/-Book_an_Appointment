require 'swagger_helper'

describe 'Reservations API' do
    path 'v1/user/reservations' do
        get 'Get all reservations' do
            tags 'Reservations'
            produces 'application/json'
            parameter name: :user_id, in: :path, type: :string, required: true
            response '200', 'reservations found' do
                let(:user_id) { create(:user).id }
                run_test!
            end
            response '404', 'reservations not found' do
                let(:user_id) { 'invalid' }
                run_test!
            end
        end
    end
    path 'v1/user/reservations' do
        post 'Create a reservation' do
            tags 'Reservations'
            produces 'application/json'
            parameter name: :user_id, in: :path, type: :string, required: true
            parameter name: :reservation, in: :body, schema: {
                type: :object,
                properties: {
                    datetime: { type: :string },
                    city: { type: :string },
                    doctor_id: { type: :integer }
                },
                required: [ 'datetime', 'city', 'doctor_id' ]
            }
            response '201', 'reservation created' do
                let(:user_id) { create(:user).id }
                let(:reservation) { { datetime: '2020-01-01', city: 'London', doctor_id: 1 } }
                run_test!
            end
            response '422', 'invalid request' do
                let(:user_id) { create(:user).id }
                let(:reservation) { { datetime: '2020-01-01' } }
                run_test!
            end
        end
    end
end