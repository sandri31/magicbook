class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :quantity
      t.integer :price
      t.integer :multiverse_ids
      t.string :image_uris

      t.timestamps
    end
  end
end
