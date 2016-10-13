class Api::V1::Admins::BaseController < ApplicationController
  before_filter :authenticate_admin_from_token!
  before_filter :authenticate_admin!

  private

  def authenticate_admin_from_token!
    authenticate_with_http_token do |token, options|
      admin_email = options[:email].presence
      admin = admin_email && admin.find_by_email(admin_email)

      if admin && Devise.secure_compare(admin.authentication_token, token)
        sign_in admin, store: false
      end
    end
  end
end
