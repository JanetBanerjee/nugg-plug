class CreateStores < ActiveRecord::Migration[5.2]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :area_code
      t.string :phone_1
      t.string :phone_2

      t.text :description
      t.string :image

      t.time :mon_open
      t.time :mon_end
      t.boolean :mon_closed
      t.time :tues_open
      t.time :tues_end
      t.boolean :tues_closed
      t.time :wed_open
      t.time :wed_end
      t.boolean :wed_closed
      t.time :thurs_open
      t.time :thurs_end
      t.boolean :thurs_closed
      t.time :fri_open
      t.time :fri_end
      t.boolean :fri_closed
      t.time :sat_open
      t.time :sat_end
      t.boolean :sat_closed
      t.time :sun_open
      t.time :sun_end
      t.boolean :sun_closed

      t.timestamps
    end
  end
end
