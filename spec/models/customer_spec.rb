require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should have_many :subscriptions }
  end

  describe 'validations' do
    it { should validate_presence_of :first }
    it { should validate_presence_of :last }
    it { should validate_presence_of :email }
    it { should validate_presence_of :address }
  end
end
