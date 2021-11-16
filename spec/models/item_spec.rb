require "rails_helper"

RSpec.describe Item, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:category) }

    it { should have_many(:messages) }

    it { should belong_to(:buyer) }

    it { should belong_to(:seller) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:image) }

    it { should validate_presence_of(:price) }

    it { should validate_presence_of(:title) }
  end
end
