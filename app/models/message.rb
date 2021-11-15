class Message < ApplicationRecord
  # Direct associations

  belongs_to :sender,
             :class_name => "User"

  # Indirect associations

  # Validations

  validates :body, :presence => true

  # Scopes

  def to_s
    sender.to_s
  end

end
