class CreateProfileCards < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_cards do |t|
      t.integer :profile_id
      t.integer :card_id

      t.timestamps
    end
  end
end
