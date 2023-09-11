require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
    it { should belong_to :customer }
    it { should have_and_belong_to_many :teas }
  end
end
