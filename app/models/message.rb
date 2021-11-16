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

  after_create_commit :notify_seller

  def notify_seller
  if sender.sent_messages.where(item: item).count == 1 && sender.phone_number.present?
      item.notify_seller
    end
  end

  def to_s
    body
  end
end
