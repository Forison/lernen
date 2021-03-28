require 'rails_helper'

RSpec.describe Checkout, type: :model do
  describe 'Association of checkout' do 
    it { should belong_to(:user) }
  end
end
