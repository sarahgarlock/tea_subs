class Tea < ApplicationRecord
  has_and_belongs_to_many :subscriptions
end
