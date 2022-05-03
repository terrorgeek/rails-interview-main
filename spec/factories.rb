FactoryBot.define do
  factory :user do
    first_name { "The" }
    last_name  { "Plumber" }
    email { 'the@plumber.com' }
    password {"12345678"}
  end

  factory :company do 

  end

  factory :company_user do 
  end

  factory :customer
end