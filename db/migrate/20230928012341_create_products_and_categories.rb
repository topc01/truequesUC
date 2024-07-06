class CreateProductsAndCategories < ActiveRecord::Migration[7.0]
  def change

    create_table :products do |t|
      t.string :title
      t.references :client, null: false, foreign_key: true
      t.text :description
      t.integer :weight
      t.string :clasification
      t.integer :use
      t.string :state

      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :categories_products, id: false do |t|
      t.belongs_to :product, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true
    end

  end
end
