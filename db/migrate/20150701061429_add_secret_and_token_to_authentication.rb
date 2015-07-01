class AddSecretAndTokenToAuthentication < ActiveRecord::Migration
  def change
    add_column :authentications, :secret, :string
    add_column :authentications, :token, :string
  end
end
