class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.string :sub_tier

      t.timestamps
    end
  end
end
