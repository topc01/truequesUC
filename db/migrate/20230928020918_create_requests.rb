class CreateRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :requests do |t|
      t.references :product, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: { to_table: :products }
      t.string :state

      t.timestamps
    end
  end
end
