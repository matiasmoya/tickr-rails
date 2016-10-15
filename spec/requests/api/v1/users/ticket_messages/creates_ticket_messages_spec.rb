require 'rails_helper'

describe 'Sends a ticket message into a ticket' do
  let!(:user)        { create(:user) }
  let!(:user_ticket) { create(:ticket, user: user)}

  context 'with valid session' do
    it 'creates the message' do
      post '/api/v1/ticket_messages.json',
        headers: {
          'Authorization' => "Token token=#{user.authentication_token}, email=#{user.email}"
        },
        params: {
          ticket_message: {
            ticket_id: user_ticket.id,
            content: "Lorem Ipsum"
          }
        }

      expect(response).to have_http_status(200)
      expect(json['ticket_message']['content']).to eq('Lorem Ipsum')
      expect(json['ticket_message']['from']).to eq('You')
    end
  end

  context 'with an invalid session' do
    it 'cannot access to the endpoint and returns an error' do
      post '/api/v1/ticket_messages.json',
        params: {
          ticket_message: {
            ticket_id: user_ticket.id,
            content: "Lorem Ipsum"
          }
        }

      expect(response).to have_http_status(401)
    end
  end
end
