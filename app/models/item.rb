class Item < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :category

  has_many   :messages,
             dependent: :destroy

  belongs_to :buyer,
             class_name: "User"

  belongs_to :seller,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end
end
