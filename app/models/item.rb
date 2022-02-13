require "open-uri"
class Item < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(location)}"

      raw_data = URI.open(url).read

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
  has_many :contacts, through: :messages, source: :sender
  # Validations

  validates :image, presence: true

  validates :price, presence: true

  validates :title, presence: true

  # Scopes

  # after_update :notify_buyer
  def notify_seller
    twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
    twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
    twilio_sending_number = ENV.fetch("TWILIO_SENDING_NUMBER")
    
    # Create an instance of the Twilio Client and authenticate with your API key
    twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    
    # Craft your SMS as a Hash with three keys
    sms_parameters = {
      :from => twilio_sending_number,
      :to => seller.phone_number,
      :body => "Someone messaged you about your item: #{title}."
    }
    
    # Send your SMS!
    twilio_client.api.account.messages.create(sms_parameters)
  end

  def notify_buyer
    return false if buyer.blank? || buyer.phone_number.blank?
    p "sending"
    if buyer_id_changed? && buyer.present?
      twilio_sid = ENV.fetch("TWILIO_ACCOUNT_SID")
      twilio_token = ENV.fetch("TWILIO_AUTH_TOKEN")
      twilio_sending_number = ENV.fetch("TWILIO_SENDING_NUMBER")
      
      # Create an instance of the Twilio Client and authenticate with your API key
      twilio_client = Twilio::REST::Client.new(twilio_sid, twilio_token)
      
      # Craft your SMS as a Hash with three keys
      sms_parameters = {
        :from => twilio_sending_number,
        :to => buyer.phone_number,
        :body => "#{seller.name} accepted your purchase of: #{title}."
      }
      
      # Send your SMS!
      twilio_client.api.account.messages.create(sms_parameters)
    end
  end

  def to_s
    title
  end
end
