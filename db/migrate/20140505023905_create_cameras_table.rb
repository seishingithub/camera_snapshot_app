class CreateCamerasTable < ActiveRecord::Migration
  def change
    create_table :cameras do |t|
      t.string :name
      t.text :description
    end
  end
end
