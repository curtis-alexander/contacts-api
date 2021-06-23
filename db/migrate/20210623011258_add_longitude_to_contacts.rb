class AddLongitudeToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :longitude, :float
  end
end
