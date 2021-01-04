class CreateSipsAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :sips_addresses do |t|

      t.timestamps
    end
  end
end
