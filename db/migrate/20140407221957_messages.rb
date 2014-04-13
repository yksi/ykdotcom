class Messages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.string :theme
      t.boolean :read
      t.text :content

      t.timestamps
    end
  end
end
