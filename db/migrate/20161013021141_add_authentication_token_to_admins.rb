class AddAuthenticationTokenToAdmins < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :authentication_token, :string
  end
end
