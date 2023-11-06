class CreateRestaurents < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurents do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.string :address
      t.string :contact, null: false
      t.float :rating
      t.string :image_url, null: false

      t.timestamps
    end
  end
end
