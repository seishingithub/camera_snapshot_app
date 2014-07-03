class DropTextColumnFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :text
  end
end