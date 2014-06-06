class DeletePhotosAndReviews < ActiveRecord::Migration
  def up
    drop_table :photos
    drop_table :reviews
  end

  def down
    raise IrreversibleMigration
  end
end
