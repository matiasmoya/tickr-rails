class Ticket < ApplicationRecord
  include ActiveModel::Serialization

  belongs_to :user
  belongs_to :admin, optional: true

  has_many :ticket_messages

  scope :unclaimed, -> { where(admin: nil) }

  def unclaimed?
    admin.blank?
  end
end
