class AddCardIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :card_id, :integer
  end
end
