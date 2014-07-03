class CreateEcards < ActiveRecord::Migration
  def change
    create_table :ecards do |t|
      t.text :text
      t.string :picture

      t.timestamps
    end
  end
end