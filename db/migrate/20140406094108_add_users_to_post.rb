class AddUsersToPost < ActiveRecord::Migration
  def change
    add_column :posts, :sender_id, :integer
    add_column :posts, :recipient_id, :integer
    remove_column :posts, :user_id
  end
end
