require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "validations" do
    it "validate presence of required fields" do
      should validate_presence_of(:order_status)
      should validate_presence_of(:order_code)
      should validate_presence_of(:order_name)
      should validate_presence_of(:order_app)
    end
  end
end
