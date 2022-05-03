require 'rails_helper'
require_relative '../shared/shared_data_setup'

RSpec.describe CustomersController do
  include_context 'shared users data setup'

  describe "Customers specs" do
    it "Should be able to see customers" do
      get :index, session: {user_id: user.id}
      expect(assigns(:my_instance_variable)).to eq("Yu Song")
    end

    it "Ajax to show newest customer should work" do
      get :newest_customer, xhr: true, session: {user_id: user.id}
      expect(response.content_type).to eq('text/javascript; charset=utf-8')
      expect(response).to render_template(:newest_customer)
      expect(assigns(:newest_customer).first_name).to eq(Customer.order(created_at: :desc).first.first_name)
    end
  end
end