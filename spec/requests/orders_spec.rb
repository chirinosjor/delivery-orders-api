require "rails_helper"

RSpec.describe "Orders", type: :request do
  describe "GET /orders" do
    before { get '/orders' }
    it "Should return OK" do
      expect(response).to have_http_status(200)
    end
  end

  describe "with data in the DB" do
    before { get '/orders' }
    let(:orders) { create_list(:orders, 5) }

    it "should return all the orders" do
      payload = JSON.parse(response.body)

      expect(payload.size).to eq(orders.size)
      expect(response).to have_http_status(200)
    end
  end
end