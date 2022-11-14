class AddCollumnColorIdentityToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :color_identity, :string
  end
end
