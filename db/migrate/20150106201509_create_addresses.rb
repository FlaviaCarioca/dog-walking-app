class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_name, limit: 100
      t.string :apt
      t.string :state_abbrv, limit: 2
      t.string :city, limit: 50
      t.string :zip_code, limit: 5
	  t.integer :user_id, null: false
	  
      t.timestamps
	end
	add_index :addresses, :user_id
  end
end
