class Ticket < ApplicationRecord
  include ActiveModel::Serialization

  belongs_to :user
  belongs_to :admin, optional: true

  has_many :ticket_messages

  scope :unclaimed, -> { where(admin: nil) }
  scope :closed,    -> { where(closed: true) }

  def unclaimed?
    admin.blank?
  end

  def switch_closed_status
    self.closed = !closed
    self.save
  end
end
