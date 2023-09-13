class Subscription < ApplicationRecord
  belongs_to :customer
  has_and_belongs_to_many :teas

  validates_presence_of :title
  validates_presence_of :price
  validates_presence_of :status
  validates_presence_of :frequency

  enum status: { non_active: 0, active: 1, cancelled: 2 }
end
