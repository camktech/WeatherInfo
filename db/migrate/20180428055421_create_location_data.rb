class CreateLocationData < ActiveRecord::Migration[5.2]
  def change
    create_table :location_data do |t|
      t.json :response
      t.integer :location_id

      t.timestamps
    end
    add_index :location_data, :location_id
  end
end
