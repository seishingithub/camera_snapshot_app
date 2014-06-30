class RenameEcardsToPhotos < ActiveRecord::Migration
  def change
    rename_table :ecards, :photos
  end
end
