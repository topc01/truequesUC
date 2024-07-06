class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :client, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :clients }
      t.text :title
      t.integer :grade
      t.text :content

      t.timestamps
    end
  end
end
