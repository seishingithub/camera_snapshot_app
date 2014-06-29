class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :recipient_name
      t.string :recipient_email
      t.string :sender_name
      t.string :sender_email
      t.text :message
    end
  end
end
