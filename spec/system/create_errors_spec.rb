require 'rails_helper'

RSpec.describe "CreateErrors", type: :system do
  describe "Creating an error" do
    it "should redirect user to the login page" do
      visit new_error_path

      p page.url

      expect(true).to eq false
    end

    xit it "should work for authenticated/logged in users" do

    end
  end
end
