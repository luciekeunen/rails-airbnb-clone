class RemovePhotoFromProfiles < ActiveRecord::Migration[5.0]
  def change
    remove_column :profiles, :photo, :string
  end
end
