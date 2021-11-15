class Item < ApplicationRecord
  # Direct associations

  belongs_to :buyer,
             :class_name => "User"

  belongs_to :seller,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    title
  end

end
