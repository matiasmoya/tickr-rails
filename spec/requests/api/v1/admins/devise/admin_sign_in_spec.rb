require 'rails_helper'

describe 'admin can sign in using the API' do
  let!(:admin) { create(:admin, email: "asd@asd.com", password: "asdqwe123", password_confirmation: "asdqwe123") }

  context 'with valid data' do
    it 'logs in' do
      params = {
        admin:{
          email: "asd@asd.com",
          password: "asdqwe123"
        }
      }

      post '/admins/sign_in.json', params: params

      expect(response).to be_success
      expect(json['token']).to eql(admin.reload.authentication_token)
    end
  end

  context 'with invalid data' do
    it 'throws an error with invalid email or password' do
      params = {
        admin: {
          email: "asd@asd.com",
          password: "anotvalidpassword"
        }
      }

      post '/admins/sign_in.json', params: params

      expect(response).to have_http_status(:unauthorized)
      expect(json['error']).to include("Invalid Email or password.")
    end
  end
end
