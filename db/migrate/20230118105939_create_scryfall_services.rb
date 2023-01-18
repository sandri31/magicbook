class CreateScryfallServices < ActiveRecord::Migration[7.0]
  def change
    create_table :scryfall_services do |t|

      t.timestamps
    end
  end
end
