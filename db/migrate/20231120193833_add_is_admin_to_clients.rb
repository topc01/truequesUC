class AddIsAdminToClients < ActiveRecord::Migration[7.0]
  def change
    add_column :clients, :is_admin, :boolean, default: false
  end
end
