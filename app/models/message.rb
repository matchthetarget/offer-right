class Message < ApplicationRecord
  # Direct associations

  # Indirect associations

  # Validations

  validates :body, :presence => true

  # Scopes

  def to_s
    sender.to_s
  end

end
