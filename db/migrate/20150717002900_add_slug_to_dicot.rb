class AddSlugToDicot < ActiveRecord::Migration
  def change
    add_column :dicots, :slug, :string
    add_index :dicots, :slug, unique: true
  end
end
