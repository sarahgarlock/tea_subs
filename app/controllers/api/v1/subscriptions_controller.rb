class Api::V1::SubscriptionsController < ApplicationController
  before_action :find_customer

  def index
    subspriptions = find_customer.subscriptions
    render json: SubscriptionSerializer.new(subspriptions)
  end

  def create
    sub = Subscription.new(subscription_params)
    sub.status = :active
    sub.save!
    render json: SubscriptionSerializer.new(sub), status: 201
  end

  def destroy
    sub = Subscription.find(params[:id])
    sub.status = :cancelled
    sub.destroy!
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :customer_id)
  end

  def find_customer
    @_customer ||= Customer.find(params[:customer_id])
  end
end
