require 'rails_helper'
RSpec.describe SessionsController do
  let!(:user_plumber) { create(:user, email: "the@plumber.com", password: "12345678") }
  let(:login_action) {
    post "create", params: {login: { email: "the@plumber.com", password: "wrong_password" }} 
  }

  describe "Sessions #create" do
    it "Should render :new after failed login" do
      #post "create", params: {login: { email: "the@plumber.com", password: "wrong_password" }} 
      login_action
      expect(response).to render_template(:new)
      expect(assigns(:my_instance_variable)).to eq("Yu Song")
    end

    # it "When login the email should be sent" do 
    #   expect{ 
    #     post "create", params: {login: { email: "the@plumber.com", password: "wrong_password" }} 
    #   }.to change { ActionMailer::Base.deliveries.count }.by(1)
    # end

    it 'When login the email should be enqueued' do 
      expect { 
        #post "create", params: {login: { email: "the@plumber.com", password: "wrong_password" }} 
        login_action
      }.to have_enqueued_mail(UserMailer, :send_email)
    end
  end
end