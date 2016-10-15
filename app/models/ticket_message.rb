class TicketMessage < ApplicationRecord
  include ActiveModel::Serialization

  belongs_to :ticket
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
end
