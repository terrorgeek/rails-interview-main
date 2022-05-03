require 'rails_helper'
require_relative '../shared/shared_data_setup'

RSpec.describe "Users", type: :feature do
  include_context "shared users data setup"
  
  before(:example) do 
    #driven_by(:selenium)
    visit "/login"
    fill_in "login_email", with: user.email
    fill_in "login_password", with: user.password
  end

  scenario "User and his companies exists" do 
    expect(user.companies.length).to eq(2)
    expect(user.email).to eq("the@plumber.com")
  end

  scenario "Login page" do 
    visit "/login"
    expect(page).to have_selector("#login_email") 
  end

  scenario "Sign in success" do 
    find("#login-button").click
    expect(current_path).to eq customers_path
  end

  scenario "Add a customer" do 
    #login first
    find("#login-button").click

    visit "/customers/new"
    fill_in "customer_first_name", with: "New customer1"
    fill_in "customer_last_name", with: "New customer last name"
    find("#create-customer-button").click
    expect(page).to have_selector("#logged-in-header")
  end
end
