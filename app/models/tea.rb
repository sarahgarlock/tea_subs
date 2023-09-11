class Tea < ApplicationRecord
  has_and_belongs_to_many :subscriptions

  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :temperature
  validates_presence_of :brew_time
end
