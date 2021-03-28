require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validation of product attributes" do 
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
  end
end
