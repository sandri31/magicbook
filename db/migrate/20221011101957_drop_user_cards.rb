class DropUserCards < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_cards
  end
end
