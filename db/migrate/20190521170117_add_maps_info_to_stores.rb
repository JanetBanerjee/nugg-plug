class AddMapsInfoToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :latitude, :float
    add_column :stores, :longitude, :float
    add_column :stores, :approval, :boolean
    add_column :stores, :store_type, :string
  end
end
