class User < ApplicationRecord
  # Direct associations

  has_many   :recieved_messages,
             :class_name => "Message",
             :foreign_key => "recipient_id",
             :dependent => :destroy

  has_many   :sent_messages,
             :class_name => "Message",
             :foreign_key => "sender_id",
             :dependent => :destroy

  has_many   :items,
             :foreign_key => "seller_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :name, :presence => true

  # Scopes

  def to_s
    email
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
