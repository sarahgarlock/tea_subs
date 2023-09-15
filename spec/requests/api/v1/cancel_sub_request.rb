require 'rails_helper'

RSpec.describe 'Cancel a subscription' do
  it 'can cancel a subscription' do
    customer = create(:customer)
    subscription = create(:subscription, status: 'active', customer_id: customer.id)

    expect(subscription.status).to eq('active')
    expect(Subscription.count).to eq(1)

    patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}", params: { subscription: { status: 'cancelled' } }
    expect(response.status).to eq(200)

    new_sub = Subscription.find_by(id: subscription.id)
    
    expect(Subscription.count).to eq(1)
    expect(response.body).to include("Subscription successfully cancelled")

    expect(new_sub.status).to eq("cancelled")
  end
end
