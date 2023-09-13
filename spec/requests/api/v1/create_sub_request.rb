require 'rails_helper'

RSpec.describe "Subscriptions", type: :request do
  describe "new subscription - happy path" do
    it "creates a new subscription for a customer" do
      customer = create(:customer)

      expect(Subscription.count).to eq(0)

      headers = {"CONTENT_TYPE" => "application/json"}
      sub_params = ({ 
                      "title" => "Tea Subscription",
                      "price" => "8.99",
                      "frequency" => "Every other week",
                      "customer_id" => "#{customer.id}"
                    })

      post "/api/v1/customers/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription: sub_params)
      
      expect(response.status).to eq(201)
      expect(response).to have_http_status(:created)
      expect(response).to be_successful
      expect(response.content_type).to eq("application/json; charset=utf-8")

      new_sub = Subscription.last
      
      expect(new_sub.customer_id).to eq(customer.id)
      expect(new_sub.title).to eq("Tea Subscription")
      expect(new_sub.price).to eq("8.99")
      expect(new_sub.status).to eq("active")
      expect(new_sub.frequency).to eq("Every other week")
      expect(Subscription.count).to eq(1)

      data = JSON.parse(response.body, symbolize_names: true)

      created_sub = data[:data]

      expect(created_sub).to be_a(Hash)
      expect(created_sub).to have_key(:id)
      expect(created_sub[:id]).to eq(new_sub.id.to_s)
      expect(created_sub[:id]).to be_a(String)

      expect(created_sub).to have_key(:type)
      expect(created_sub[:type]).to eq("subscription")
      expect(created_sub[:type]).to be_a(String)

      expect(created_sub).to have_key(:attributes)
      expect(created_sub[:attributes]).to be_a(Hash)
      
      attributes = created_sub[:attributes]

      expect(attributes[:title]).to eq(new_sub.title)
      expect(attributes[:title]).to eq("Tea Subscription")

      expect(attributes[:price]).to eq(new_sub.price)
      expect(attributes[:price]).to eq("8.99")

      expect(attributes[:status]).to eq(new_sub.status)
      expect(attributes[:status]).to eq("active")

      expect(attributes[:frequency]).to eq(new_sub.frequency)
      expect(attributes[:frequency]).to eq("Every other week")
    end
  end

  describe "new subscription - sad path" do
    it 'returns an error if validated info not filled in' do
      customer = create(:customer)
  
      headers = { "CONTENT_TYPE" => "application/json" }
      sub_params = ({
                    "title" => "Tea Subscription",
                    "price" => "", # empty string
                    "frequency" => "Every other week",
                    "customer_id" => "#{customer.id}"
                  })

      post "/api/v1/customers/#{customer.id}/subscriptions", headers: headers, params: JSON.generate(subscription: sub_params)

      expect(Subscription.count).to eq(0)
      expect(response).to have_http_status(:bad_request)

      error = JSON.parse(response.body, symbolize_names: true)

      message = error[:errors][0][:detail]

      expect(message).to eq("Validation failed: Price can't be blank")
    end
  end
end
