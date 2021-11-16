class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price
      t.integer :seller_id
      t.text :description
      t.integer :category_id
      t.string :location
      t.integer :buyer_id
      t.string :image

      t.timestamps
    end
  end
end
