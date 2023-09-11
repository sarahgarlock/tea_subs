class Customer < ApplicationRecord
  has_many :subscriptions

  validates_presence_of :first
  validates_presence_of :last
  validates_presence_of :email
  validates_presence_of :address
end
