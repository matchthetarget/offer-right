class AddSellerReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :users, column: :seller_id
    add_index :items, :seller_id
    change_column_null :items, :seller_id, false
  end
end
