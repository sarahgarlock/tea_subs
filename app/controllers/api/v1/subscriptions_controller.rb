class Api::V1::SubscriptionsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  before_action :find_customer

  def index
    subscriptions = find_customer.subscriptions
    render json: SubscriptionSerializer.new(subscriptions)
  end

  def create
    sub = Subscription.create(subscription_params)
    sub.status = :active
    sub.save!
    render json: SubscriptionSerializer.new(sub), status: 201
  end

  def destroy
    sub = Subscription.find(params[:id])
    sub.status = :cancelled
    sub.destroy!
    render json: SuccessSerializer.success_message("Subscription successfully cancelled"), status: 200
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :customer_id)
  end

  def find_customer
    @_customer ||= Customer.find(params[:customer_id])
  end

  def record_invalid(error)
    render json: ErrorSerializer.error_message(error), status: 400
  end
end
