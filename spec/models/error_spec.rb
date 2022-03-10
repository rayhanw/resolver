require "rails_helper"

RSpec.describe Error, type: :model do
  let(:error) { create(:error) }
  let(:built_error) { build(:error) }

  describe "#title" do
    it "must have a title" do
      expect(error.title).to match(/model_name/)
    end

    it "throws a validation error if no title is given" do
    end
  end

  describe "#details" do
    it "must have details" do
      expect(error.details).to match(/simple_form_for/)
    end
  end

  describe "#resolver" do
    it "must have a resolver" do
      expect(error.resolver).to match(/In restaurants\/show.html.erb/)
    end
  end
end
