require 'rails_helper'

RSpec.describe 'Cancel a subscription' do
  it 'can cancel a subscription' do
    customer = create(:customer)
    subscription = create(:subscription, status: 'active', customer_id: customer.id)

    expect(subscription.status).to eq('active')
    expect(Subscription.count).to eq(1)

    patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: { subscription: { status: 'cancelled' } }
    expect(response.status).to eq(200)

    expect(Subscription.count).to eq(1)
    expect(response.body).to include("Subscription successfully cancelled")

    subscription.reload
    expect(subscription.status).to eq("cancelled")
  end
end
