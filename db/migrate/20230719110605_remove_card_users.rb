class RemoveCardUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :card_users
  end
end
