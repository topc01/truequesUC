class AddImageDataToClient < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :image_data, :text
    add_column :products, :image_data, :text
  end
end
