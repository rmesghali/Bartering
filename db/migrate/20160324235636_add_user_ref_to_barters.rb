class AddUserRefToBarters < ActiveRecord::Migration
  def change
    add_reference :barters, :user, index: true, foreign_key: true
  end
end
