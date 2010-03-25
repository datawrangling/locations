class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.integer :geonameid
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :country_code
      t.string :cc2
      t.string :fipscode
      t.string :county
      t.integer :population

      t.timestamps
    end
    add_index "locations", ["name", "population"], :name => "name_pop_index"
  end

  def self.down
    drop_table :locations
  end
end
