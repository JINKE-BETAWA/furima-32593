class CreateSipsAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :sips_addresses do |t|

      t.string     :post_code,        null: false
      t.integer    :area_id,          null: false
      t.string     :city,             null: false
      t.string     :street_number,    null: false
      t.string     :building_number
      t.string     :phone_number,     null: false
      t.references :purchase,         foreign_key: true

      t.timestamps
    end
  end
end
