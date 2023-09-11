require 'rails_helper'

RSpec.describe Tea, type: :model do
  describe 'relationships' do
    it { should have_and_belong_to_many :subscriptions }
  end
end
