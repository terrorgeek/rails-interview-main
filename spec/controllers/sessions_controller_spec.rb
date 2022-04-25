require 'rails_helper'
RSpec.describe SessionsController do
  let!(:user_plumber) { create(:user, email: "the@plumber.com", password: "12345678") }

  describe "Sessions #create" do
    it "Should render :new after failed login" do
      post "create", params: {login: { email: "the@plumber.com", password: "wrong_password" }} 
      expect(response).to render_template(:new)
    end
  end
end