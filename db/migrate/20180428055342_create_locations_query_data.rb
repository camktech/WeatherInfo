class CreateLocationsQueryData < ActiveRecord::Migration[5.2]
  def change
    create_table :locations_query_data do |t|
      t.json :response
      t.string :query

      t.timestamps
    end
    add_index :locations_query_data, :query
  end
end
