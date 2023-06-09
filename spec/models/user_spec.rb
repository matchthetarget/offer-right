require "rails_helper"

RSpec.describe User, type: :model do
  describe "Direct Associations" do
    it { should have_many(:bought_items) }

    it { should have_many(:recieved_messages) }

    it { should have_many(:sent_messages) }

    it { should have_many(:items) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
