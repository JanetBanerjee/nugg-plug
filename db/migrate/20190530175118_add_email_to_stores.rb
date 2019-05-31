class AddEmailToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :email, :string
  end
end
