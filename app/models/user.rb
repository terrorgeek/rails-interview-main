class User < ApplicationRecord
  has_secure_password

  has_many :company_users
  has_many :companies, through: :company_users

  validates :first_name, :last_name, presence: true
  validates :email, presence: true,
                    uniqueness: true,
                    format: { with: URI::MailTo::EMAIL_REGEXP }
end
