class CreateFoodItems < ActiveRecord::Migration[7.1]
  def change
    create_table :food_items do |t|

      t.string :name, null: false
      t.float :price, null: false
      t.string :description
      t.references :restaurant, null: false, foreign_key: true
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
