require 'rails_helper'

RSpec.describe ErrorsController, type: :request do
  let(:error) { create(:error) }

  describe "GET /errors/:id" do
    it "renders the errors#show page" do
      get "/errors/#{error.id}"

      expect(response).to render_template(:show)
      expect(response.body).to include(error.title)
    end
  end
end
