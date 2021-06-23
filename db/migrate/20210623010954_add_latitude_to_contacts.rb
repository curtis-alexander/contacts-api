class AddLatitudeToContacts < ActiveRecord::Migration[6.1]
  def change
    add_column :contacts, :latitude, :float
  end
end
