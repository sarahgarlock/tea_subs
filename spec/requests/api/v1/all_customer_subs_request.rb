require 'rails_helper'

RSpec.describe 'All Customer Subscriptions', type: :request do
  describe 'happy path' do
    it 'can return all customer subscriptions' do
      customer = create(:customer)
      subscription1 = create(:subscription, status: 1, customer: customer)
      subscription2 = create(:subscription, status: 1, customer: customer)
      subscription3 = create(:subscription, status: 2, customer: customer)

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful

      subscriptions = JSON.parse(response.body, symbolize_names: true)

      expect(subscriptions[:data].count).to eq(3)

      first_sub = subscriptions[:data].first

      expect(first_sub).to have_key(:id)
      expect(first_sub[:id]).to be_a(String)

      expect(first_sub).to have_key(:type)
      expect(first_sub[:type]).to be_a(String)

      expect(first_sub).to have_key(:attributes)
      expect(first_sub[:attributes]).to be_a(Hash)

      attributes = first_sub[:attributes]

      expect(attributes).to have_key(:title)
      expect(attributes[:title]).to be_a(String)
      
      expect(attributes).to have_key(:price)
      expect(attributes[:price]).to be_a(String)

      expect(attributes).to have_key(:status)
      expect(attributes[:status]).to be_a(String)

      expect(attributes).to have_key(:frequency)
      expect(attributes[:frequency]).to be_a(String)
    end
  end
end