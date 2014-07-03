class ChangePictureToDescriptionOnPhotos < ActiveRecord::Migration
  def change
    rename_column :photos, :picture, :description
  end
end
