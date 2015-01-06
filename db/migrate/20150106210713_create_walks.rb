class CreateWalks < ActiveRecord::Migration
  def change
    create_table :walks do |t|
	  t.integer :dog_id
	  t.integer :walker_id
	  t.integer :created_by
	  t.integer :time
	  t.date :date

	  t.timestamps
	end

	add_index :walks, :dog_id
	add_index :walks, :walker_id
	add_index :walks, :time
	add_index :walks, :date
  end
end


