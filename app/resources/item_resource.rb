class ItemResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :price, :string
  attribute :seller_id, :integer
  attribute :description, :string
  attribute :category_id, :integer
  attribute :location, :string
  attribute :buyer_id, :integer
  attribute :image, :string

  # Direct associations

  belongs_to :category

  has_many   :messages

  belongs_to :buyer,
             resource: UserResource

  belongs_to :seller,
             resource: UserResource

  # Indirect associations
end
