class AddColumnsToProfile < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :city, :string
    add_column :profiles, :country_code, :string
    add_column :profiles, :zip_code, :string
  end
end
