class Api::V1::SubscriptionsController < ApplicationController
  before_action :find_customer

  def create
    sub = Subscription.new(subscription_params)
    sub.status = :active
    sub.save!
    render json: SubscriptionSerializer.new(sub), status: 201
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :customer_id)
  end

  def find_customer
    @_customer ||= Customer.find(params[:customer_id])
  end
end
