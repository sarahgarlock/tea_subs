require 'rails_helper'

RSpec.describe 'Cancel a subscription' do
  it 'can cancel a subscription' do
    customer = create(:customer)
    subscription = create(:subscription, customer_id: customer.id)
    
    expect(Subscription.count).to eq(1)

    delete "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}"

    expect(response.status).to eq(204)
    expect(Subscription.count).to eq(0)
    expect{ Subscription.find(subscription.id) }.to raise_error(ActiveRecord::RecordNotFound)
  end
end