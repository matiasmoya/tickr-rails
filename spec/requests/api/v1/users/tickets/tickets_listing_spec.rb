require 'rails_helper'

describe 'Lists current user tickets' do
  let!(:user)        { create(:user) }
  let!(:user_ticket) { create(:ticket, user: user)}
  let!(:ticket)      { create(:ticket)}

  context 'with valid session' do
    it 'retrieves the user tickets list' do
      get '/api/v1/tickets.json',
        headers: {
          'Authorization' => "Token token=#{user.authentication_token}, email=#{user.email}"
        }

      expect(response).to have_http_status(200)
      expect(json['tickets'].size).to eq(1)
      expect(json['tickets'][0]['id']).to eq(user_ticket.id)
    end
  end

  context 'with an invalid session' do
    it 'cannot access to the endpoint and returns an error' do
      get '/api/v1/tickets.json'

      expect(response).to have_http_status(401)
    end
  end
end
