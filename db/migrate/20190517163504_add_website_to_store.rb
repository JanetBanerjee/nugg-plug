class AddWebsiteToStore < ActiveRecord::Migration[5.2]
  def change
    add_column :stores, :website, :string
  end
end
