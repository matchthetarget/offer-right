class Message < ApplicationRecord
  # Direct associations

  belongs_to :item

  belongs_to :recipient,
             class_name: "User"

  belongs_to :sender,
             class_name: "User"

  # Indirect associations

  # Validations

  validates :body, presence: true

  # Scopes

  def to_s
    sender.to_s
  end
end
