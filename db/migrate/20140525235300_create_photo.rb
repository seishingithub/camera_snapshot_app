class CreatePhoto < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :name
      t.references :review, index: true
    end
  end
end
