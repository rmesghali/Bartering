class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :barters, :location, :neighborhood
  end
end
