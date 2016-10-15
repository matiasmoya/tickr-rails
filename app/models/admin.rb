class Admin < ApplicationRecord
  devise :database_authenticatable, :validatable

  has_many :tickets
  has_many :ticket_messages

  before_save :ensure_authentication_token

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
