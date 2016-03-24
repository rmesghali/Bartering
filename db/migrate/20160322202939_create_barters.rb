class CreateBarters < ActiveRecord::Migration
  def change
    create_table :barters do |t|
      t.string :product
      t.text :description
      t.text :category
      t.text :location
      t.date :expiration

      t.timestamps null: false
    end
  end
end
