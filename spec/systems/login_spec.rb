require 'rails_helper'

RSpec.describe "Users", type: :system do
  let!(:user) {create(:user, email: "the@plumber.com", password: "12345678", first_name: "The", last_name: "Plumber")}
  
  before do 
    driven_by(:selenium)
  end

#   scenario "Login page" do 
#     visit "/login"
#     expect(page).to have_selector("#login_email") 
#   end

  scenario "User exists" do 
    expect(user.email).to eq("the@plumber.com")
  end

#   scenario "Sign in success" do 
#     visit "/login"
#     fill_in "login_email", with: user.email
#     fill_in "login_password", with: user.password
#     find("#login-button").click
#     expect(page).to have_selector("#logged-in-header")
#   end

  scenario "Add a customer" do 
    visit "/customers/new"
    fill_in "customer_first_name", with: "New customer1"
    fill_in "customer_last_name", with: "New customer last name"
    find("#create-customer-button").click
    expect(page).to have_content("successfully created.")
  end
end
