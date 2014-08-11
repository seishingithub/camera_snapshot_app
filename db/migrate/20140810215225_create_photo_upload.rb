class CreatePhotoUpload < ActiveRecord::Migration
  def change
    create_table :photo_uploads do |t|
      t.string :name
      t.timestamps
    end
  end
end
