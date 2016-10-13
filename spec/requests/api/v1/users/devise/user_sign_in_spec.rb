require 'rails_helper'

describe 'User can sign in using the API' do
  let!(:user) { create(:user, email: "asd@asd.com", password: "asdqwe123", password_confirmation: "asdqwe123") }

  context 'with valid data' do
    it 'logs in' do
      params = {
        user:{
          email: "asd@asd.com",
          password: "asdqwe123"
        }
      }

      post '/users/sign_in.json', params: params

      expect(response).to be_success
      expect(json['token']).to eql(user.reload.authentication_token)
    end
  end

  context 'with invalid data' do
    it 'throws an error with invalid email or password' do
      params = {
        user: {
          email: "asd@asd.com",
          password: "anotvalidpassword"
        }
      }

      post '/users/sign_in.json', params: params

      expect(response).to have_http_status(:unauthorized)
      expect(json['error']).to include("Invalid Email or password.")
    end
  end
end
