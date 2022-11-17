class AddColumnPriceTotalToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :price_total, :decimal, precision: 8, scale: 2
  end
end
