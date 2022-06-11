require 'rails_helper'

RSpec.describe Tag, type: :model do
  let!(:rails) { create(:tag, name: "Rails") }
  let(:dupe) { build(:tag, name: "Rails") }

  describe "#name" do
    it "should return `Rails`" do
      expect(rails.name).to eq "Rails"
    end

    it "should throw an error if same Tag name was built" do
      expect { dupe.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
