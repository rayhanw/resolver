require 'rails_helper'

RSpec.describe Keyword, type: :model do
  let(:one) { create(:keyword) }
  let(:two) { build(:keyword, error: one.error, tag: one.tag) }

  describe "relations" do
    it "should throw an error if the pairing already exists" do
      expect { two.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
