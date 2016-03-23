class AddColumnToBarters < ActiveRecord::Migration
  def change
    add_column :barters, :neighborhood, :string
  end
end
