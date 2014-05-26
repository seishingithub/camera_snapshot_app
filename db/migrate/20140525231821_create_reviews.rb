class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :make, :null => false
      t.string :model, :null => false
      t.text :camera_review, :null => false
      t.text :conclusion, :null => false

      t.timestamps
    end
  end
end
