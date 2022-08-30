require 'swagger_helper'

describe 'Users API' do
  path '/v1/users' do
    get 'Get all users' do
      tags 'Users'
      produces 'application/json'
      response '200', 'users found' do
        run_test!
      end
    end
  end
  path '/v1/users' do
    post 'Create a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: ['username']
      }
      response '201', 'user created' do
        let(:user) { { username: 'Moises' } }
        # run_test!
      end
      response '422', 'invalid request' do
        let(:user) { { username: ' Miller' } }
        # run_test!
      end
    end

    path '/v1/users/{id}' do
      get 'Get a user' do
        tags 'Users'
        produces 'application/json'
        parameter username: :id, in: :path, type: :string, required: true
        response '200', 'user found' do
          let(:id) { create(:user).id }
          # run_test!
        end
        response '404', 'user not found' do
          let(:id) { 'invalid' }
          # run_test!
        end
      end
    end

    path '/v1/users/{id}' do
      put 'Update a user' do
        tags 'Users'
        consumes 'application/json'
        parameter name: :id, in: :path, type: :string, required: true
        parameter name: :user, in: :body, schema: {
          type: :object,
          properties: {
            username: { type: :string }
          },
          required: ['username']
        }
        response '200', 'user updated' do
          let(:id) { create(:user).id }
          let(:user) { { username: 'Moises' } }
          # run_test!
        end
        response '404', 'user not found' do
          let(:id) { 'invalid' }
          let(:user) { { username: ' Miller' } }
          # run_test!
        end
      end
    end
  end
end
