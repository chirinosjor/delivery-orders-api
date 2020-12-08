require "rails_helper"

RSpec.describe "Orders", type: :request do
  describe "GET /orders" do
    before { get '/orders' }
    it "Should return OK" do
      expect(response).to have_http_status(200)
    end
  end

  describe "with data in the DB" do
    let!(:order) { create_list(:order, 5) }
    before { get '/orders' }

    it "should return all the orders" do
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(order.size)
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /orders" do
    it "should create an order" do
      req_payload = {
        order: {
          order_status: "Status",
          order_code: "ABC123",
          order_name: "Nombre",
          order_app: "App"
        }
      }

      post "/orders", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(response).to have_http_status(:created)
    end

    it "should return error message on invalid order" do
      req_payload = {
        order: {
          order_code: "ABC123",
          order_name: "Nombre",
          order_app: "App"
        }
      }

      post "/orders", params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end  
end