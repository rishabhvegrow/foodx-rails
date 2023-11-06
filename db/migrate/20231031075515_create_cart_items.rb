class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.references :user, null: false, foreign_key: true
      t.references :food_item, null: false, foreign_key: true
      t.integer :quantity
      t.float :price, null: false
      t.references :transaction
      t.boolean :is_checked_out, default: false

      t.timestamps
    end
  end
end
