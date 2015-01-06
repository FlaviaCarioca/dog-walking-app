class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      t.string :name
      t.integer :number_of_dogs

      t.timestamps
    end
  end
end
