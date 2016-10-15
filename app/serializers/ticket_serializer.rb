class TicketSerializer < ActiveModel::Serializer
  attributes :id, :subject, :content

  has_many :ticket_messages
end
