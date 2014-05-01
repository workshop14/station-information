class AddLocationToStation < ActiveRecord::Migration
  def change
    add_column :stations, :address, :string
    add_column :stations, :postcode, :string
    add_column :stations, :latitude, :decimal, precision: 10, scale: 6
    add_column :stations, :longitude, :decimal, precision: 10, scale: 6
  end
end
