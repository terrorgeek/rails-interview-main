require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:user_plumber) { create(:user, email: "the@plumber.com", password: "12345678") }

  describe "POST /login" do
    it "Session user_id should be set after successfully login a user" do
      post "/login", params: {login: { email: "the@plumber.com", password: "12345678" }}
      expect(session[:user_id]).to eq(user_plumber.id.to_s)
    end

    it "Should set flash[:alert] after failed login" do
      post "/login", params: {login: { email: "the@plumber.com", password: "wrong_password" }} 
      expect(flash[:alert]).to eq("Incorrect email or password, try again.")
    end
  end
end
