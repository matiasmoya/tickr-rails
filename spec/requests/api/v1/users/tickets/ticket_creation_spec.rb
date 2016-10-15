require 'rails_helper'

describe 'User creates a ticket' do
  let!(:user) { create(:user) }

  context 'with valid session' do
    it 'creates a new ticket' do
      post '/api/v1/tickets.json',
        headers: {
          'Authorization' => "Token token=#{user.authentication_token}, email=#{user.email}"
        },
        params: {
          ticket: {
            subject: "Lorem Ipsum",
            content: "Hodor hodor - HODOR. Hodor hodor? Hodor hodor"
          }
        }

      expect(response).to have_http_status(200)
      expect(json['ticket']['subject']).to eq('Lorem Ipsum')
      expect(user.tickets.size).to eq(1)
    end
  end

  context 'with an invalid session' do
    it 'cannot access to the endpoint and returns an error' do
      post '/api/v1/tickets.json',
        params: {
          ticket: {
            subject: "Lorem Ipsum",
            content: "Hodor hodor - HODOR. Hodor hodor? Hodor hodor"
          }
        }

      expect(response).to have_http_status(401)
      expect(Ticket.count).to eq(0)
    end
  end
end
