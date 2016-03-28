class RemoveCityFromBarters < ActiveRecord::Migration
  def change
    remove_column :barters, :city, :string
    remove_column :barters, :state, :string
    remove_column :barters, :zip, :integer 
  end
end
