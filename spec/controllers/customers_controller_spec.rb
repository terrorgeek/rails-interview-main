require 'rails_helper'
require_relative '../shared/shared_data_setup'

RSpec.describe CustomersController do
  include_context 'shared users data setup'

  describe "Customers specs" do
    it "Should be able to see customers" do
      get :index, session: {user_id: user.id}
      expect(assigns(:my_instance_variable)).to eq("Yu Song")
    end
  end
end