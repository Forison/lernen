require 'rails_helper'

RSpec.describe Checkout, type: :model do
  describe 'Association of checkout' do 
    it { should belong_to(:user) }
  end

  describe "Validation of attributes" do 
    it { should validate_presence_of(:details) }
  end
end
