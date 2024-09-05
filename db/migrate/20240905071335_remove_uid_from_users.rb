class RemoveUidFromUsers < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :uid, :string
    remove_column :users, :provider, :string
    add_column :users, :google_auth_uid, :string
  end
end
