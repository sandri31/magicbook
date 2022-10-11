class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.text :title
      t.string :description
      t.text :author
      t.integer :year
      t.string :image_uri
      t.string :categorie
      t.text :color
      t.text :note
      t.integer :price
      t.datetime :add_date
      t.text :lang
      t.boolean :foil

      t.timestamps
    end
  end
end
