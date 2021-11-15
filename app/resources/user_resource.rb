class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :email, :string
  attribute :password, :string
  attribute :name, :string

  # Direct associations

  has_many   :recieved_messages,
             resource: MessageResource,
             foreign_key: :recipient_id

  has_many   :sent_messages,
             resource: MessageResource,
             foreign_key: :sender_id

  has_many   :items,
             foreign_key: :seller_id

  # Indirect associations

end
