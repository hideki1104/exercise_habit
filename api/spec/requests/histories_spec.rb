require 'rails_helper'

RSpec.describe "Histories", type: :request do
  describe "GET /create,index" do
    it "returns http success" do
      get "/histories/create,index"
      expect(response).to have_http_status(:success)
    end
  end

end
