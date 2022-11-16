class ChangeColumnToQuantityFromCards < ActiveRecord::Migration[7.0]
  def change
    change_column :cards, :quantity, :integer, default: 0
  end
end
