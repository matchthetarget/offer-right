require "open-uri"
class Item < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :image, ImageUploader

  # Direct associations

  belongs_to :category

  has_many   :messages,
             dependent: :destroy

  belongs_to :buyer,
             optional: true,
             class_name: "User"

  belongs_to :seller,
             class_name: "User"

  # Indirect associations

  # Validations

  validates :image, presence: true

  validates :price, presence: true

  validates :title, presence: true

  # Scopes

  def to_s
    title
  end
end
