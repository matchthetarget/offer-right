json.extract! item, :id, :title, :price, :seller_id, :description,
              :category_id, :location, :buyer_id, :image, :created_at, :updated_at
json.url item_url(item, format: :json)
