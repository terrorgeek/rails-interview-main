class User < ApplicationRecord
  has_secure_password

  has_one :company_user
  has_one :company, through: :company_user

  validates :first_name, :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
end
