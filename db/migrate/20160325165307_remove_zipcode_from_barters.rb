class RemoveZipcodeFromBarters < ActiveRecord::Migration
  def change
    remove_column :barters, :zipcode
    add_column :barters, :zip, :integer  
  end
end
