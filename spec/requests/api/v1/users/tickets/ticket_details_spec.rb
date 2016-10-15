require 'rails_helper'

describe 'User creates a ticket' do
  let!(:user)           { create(:user) }
  let!(:ticket)         { create(:ticket, user: user) }
  let!(:ticket_message) { create(:ticket_message, ticket: ticket, user: user)}

  context 'with valid session' do
    it 'creates a new ticket' do
      get "/api/v1/tickets/#{ticket.id}.json",
        headers: {
          'Authorization' => "Token token=#{user.authentication_token}, email=#{user.email}"
        }

      expect(response).to have_http_status(200)
      expect(json['ticket']['id']).to eq(ticket.id)
      expect(json['ticket']['ticket_message_ids']).to eq([ticket_message.id])
    end
  end

  context 'with an invalid session' do
    it 'cannot access to the endpoint and returns an error' do
      get "/api/v1/tickets/#{ticket.id}.json"

      expect(response).to have_http_status(401)
    end
  end
end
