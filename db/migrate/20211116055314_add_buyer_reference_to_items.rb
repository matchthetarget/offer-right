class AddBuyerReferenceToItems < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :items, :users, column: :buyer_id
    add_index :items, :buyer_id
  end
end
