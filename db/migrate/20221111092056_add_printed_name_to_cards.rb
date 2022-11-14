class AddPrintedNameToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :printed_name, :string
  end
end
