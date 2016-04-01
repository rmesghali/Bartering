class RemoveInterestedInFromBarters < ActiveRecord::Migration
  def change
    remove_column :barters, :interested_in, :string
  end
end
