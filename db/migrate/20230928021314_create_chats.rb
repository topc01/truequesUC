class CreateChats < ActiveRecord::Migration[7.0]
  def change
    create_table :chats do |t|
      t.references :client1, null: false, foreign_key: { to_table: :clients, column: :client1_id }
      t.references :client2, null: false, foreign_key: { to_table: :clients, column: :client2_id }

      t.timestamps
    end

    create_table :messages do |t|
      t.references :chat, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end
    
  end
end
