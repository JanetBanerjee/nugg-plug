class AddThumbnailToStores < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :thumb, :string
  end
end
