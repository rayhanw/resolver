require "rails_helper"

RSpec.describe Error, type: :model do
  let(:error) { create(:error) }
  let(:built_error) { build(:error, title: nil) }

  describe "#title" do
    it "has a title" do
      expect(error.title).to match(/model_name/)
    end

    it "throws a validation error if no title is given" do
      expect(built_error).to_not be_valid
    end
  end

  describe "#details" do
    it "has details" do
      expect(error.details).to match(/simple_form_for/)
    end
  end

  describe "#resolver" do
    it "has a resolver" do
      expect(error.resolver).to match(/In restaurants\/show.html.erb/)
    end
  end
end
