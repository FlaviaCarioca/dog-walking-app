class CreateWalkers < ActiveRecord::Migration
  def change
    create_table :walkers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :level_id
      t.float :price
      t.integer :address_id
      t.integer :comment_id

      t.timestamps
	end
	add_index :walkers, :address_id
	add_index :walkers, :comment_id
  end
end
