class AddCityToBarters < ActiveRecord::Migration
  def change
    add_column :barters, :city, :string
    add_column :barters, :state, :string
    add_column :barters, :zip, :integer
  end
end
