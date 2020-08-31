class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :image, null: false 
      t.string :name, null: false 
      t.string :explanation, null: false 
      t.integer :category, null: false 
      t.integer :condition, null: false 
      t.integer :shipping_charge, null: false 
      t.integer :prefecture, null: false 
      t.integer :days_until_shipping, null: false 
      t.integer :price, null: false
      t.references :user, null: false 
      t.timestamps
    end
  end
end
